
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/themedata.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final IconData? sufficiconData;
  final String hintText;
  final TextInputType keyBoardType;
  final IconData? iconData;
  final bool obscure;
  final VoidCallback? suffixAction;
  final TextInputAction? nextAction;
  final bool? enabled;
  final int? maxLines;
  final void Function(String)? onChanged;
  final String? initialValue;
  final TextCapitalization? textCapitalisation;
  const CustomTextFormField({
    Key? key,
    this.validator,
    this.sufficiconData,
    required this.hintText,
    required this.keyBoardType,
    required this.iconData,
    this.obscure = false,
    this.suffixAction,
    this.nextAction,
    this.enabled =  true,
    this.maxLines,
    this.onChanged,
    this.initialValue,
    this.textCapitalisation,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalisation ?? TextCapitalization.none,
      textInputAction: nextAction ?? TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscure,
      enabled: enabled ?? true,
      initialValue: initialValue,
      controller: textController,
      keyboardType: keyBoardType,
      
      validator: validator,
      maxLines: maxLines ?? 1,
      onChanged: onChanged ?? (value) {},
      keyboardAppearance: Brightness.dark,
      style: GoogleFonts.ubuntu(color: enabled! ? Colors.deepPurple : Colors.red),
      decoration: InputDecoration(
        suffixIcon: sufficiconData != null
            ? GestureDetector(
                onTap: suffixAction ?? () {},
                child: Icon(
                  sufficiconData,
                  size: 17.sp,
                  color: kPrimaryColor,
                ))
            : null,
        prefixIcon: Icon(
          iconData,
          size: 17.sp,
          color: kPrimaryColor,
        ),
        labelText: hintText,
        labelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        hintStyle: normalTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0.1,
            style: BorderStyle.none,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0.1,
            style: BorderStyle.none,
          ),
        ),
        // hintText: hintText,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
