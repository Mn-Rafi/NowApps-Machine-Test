
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class CustomPinInputField extends StatelessWidget {
  const CustomPinInputField({
    Key? key,
    required this.otpTextController,
    required this.newTextEditingController,
  }) : super(key: key);

  final TextEditingController otpTextController;
  final TextEditingController newTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        onChanged: (val) {
          otpTextController.text = '';
        },
        appContext: context,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 14.w,
          fieldWidth: 12.w,
          activeFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        controller: newTextEditingController,
        onCompleted: (value) {
          otpTextController.text = value;
        },
      ),
    );
  }
}
