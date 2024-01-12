import 'dart:async';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';

class AbsentController extends GetxController {
  late RxString currentTime;
  late RxString period;
  late Timer _timer;
  late RxString currentClock;
  late CameraController _controller;
  Rx<Position?> currentLocation = Rx<Position?>(null);
  RxString currentAddress = ''.obs;
  RxBool hasLocationPermission = RxBool(false);
  RxBool isRefreshing = RxBool(false);

  CameraController get controller => _controller;

  @override
  void onInit() {
    super.onInit();
    var timeData = formatTime(DateTime.now());
    currentTime = timeData[0].obs;
    period = timeData[1].obs;

    currentClock = 'clock-in'.obs;

    // Update the time every second
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      var timeData = formatTime(DateTime.now());
      currentTime.value = timeData[0];
      period.value = timeData[1];
    });

    // checkLocationPermission();
    _getCurrentLocation();
  }

  @override
  void onClose() {
    _timer.cancel();
    _controller.dispose(); // Cancel the timer to avoid memory leaks
    super.onClose();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[1], ResolutionPreset.medium);
    await _controller.initialize();
    update(); // Notify listeners
  }

  Future<void> _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    // Set currentAddress to an empty string and currentLocation to null
    currentAddress.value = "";
    currentLocation.value = null;

    try {
      isRefreshing.value = true;
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentLocation.value = position;
      await placemarkFromCoordinates(position.latitude, position.longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        currentAddress.value =
            '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
      }).catchError((e) {
        print("Error getting placemark: $e");
      });
    } catch (e) {
      print("Error getting location: $e");
    } finally {
      isRefreshing.value = false; // Reset the flag after refresh is complete
    }
  }

  Future<void> refreshLocation() async {
    await _getCurrentLocation();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
          "Location permissions are permanently denied, we cannot request permissions.");

      return false;
    }
    return true;
  }

  List<String> formatTime(DateTime dateTime) {
    String formattedTime = DateFormat('hh:mm').format(dateTime);
    String period = DateFormat('a').format(dateTime).toLowerCase();
    return [formattedTime, period];
  }
}
