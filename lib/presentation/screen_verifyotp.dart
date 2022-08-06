import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/logic/cubit_login_screen/login_screen_cubit.dart';
import 'package:nowapps/presentation/screen_login.dart';
import 'package:nowapps/presentation/screen_retailers.dart';
import 'package:nowapps/presentation/widgets/custom_image_card.dart';
import 'package:nowapps/presentation/widgets/custom_pinputfield.dart';
import 'package:nowapps/presentation/widgets/custom_submitbutton.dart';
import 'package:nowapps/themedata.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class ScreenVerifyOTP extends StatelessWidget {
  ScreenVerifyOTP({Key? key}) : super(key: key);
  final newTextEditingController = TextEditingController();
  final TextEditingController otpTextController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kboxdecoration,
      child: Scaffold(
        appBar: customAppBar('Login'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                  width: 100.w,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 900),
                  child: Text(
                    'Hello Again!',
                    style: mainHeaderStyle.copyWith(
                      color: isLightTheme(context)
                          ? kContentColorLightTheme
                          : kContentColorDarkTheme,
                    ),
                  ),
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 900),
                  child: Text(
                    'Type the verification code we have sent to \n+91 ${ScreenLogin.mobileNumberController.text}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: isLightTheme(context)
                            ? kContentColorLightTheme
                            : kContentColorDarkTheme),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 700),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: const CustomImageCard(
                      imagePath: 'assets/channelkonnect_logo_white.png',
                      ratio: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 500),
                  child: CustomPinInputField(
                      otpTextController: otpTextController,
                      newTextEditingController: newTextEditingController),
                ),
                BlocConsumer<LoginScreenCubit, LoginScreenState>(
                  listener: (context, state) {
                    if (state is VerifyScreenLoaded) {
                      showSnackBar(
                        text: 'Logged in succesfully',
                        context: context,
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const ScreenRetailersList()),
                          (route) => false);
                    }
                    if (state is LoginScreenLoading) {
                      showSnackBar(text: 'Checking the otp', context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is VerifyScreenLoading) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 10.w),
                        child: const CustomLoadingSubmitButton(
                            text: 'VERIFY OTP', bgColor: Colors.deepPurple),
                      );
                    }
                    return FadeInDown(
                      child: GestureDetector(
                        onTap: () {
                          log('here ${otpTextController.text}');
                          if (otpTextController.text.isNotEmpty) {
                            context.read<LoginScreenCubit>().submitLogin();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 10.w),
                          child: const CustomSubmitButton(
                              text: 'VERIFY OTP', bgColor: Colors.deepPurple),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
