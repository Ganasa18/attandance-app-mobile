import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';

Widget buildOtpInput({
  required BuildContext context,
}) {
  return SizedBox(
    height: 68,
    width: 64,
    child: TextField(
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: greyDarkColor,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    ),
  );
}
