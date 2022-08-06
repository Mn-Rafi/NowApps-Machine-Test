import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/logic/cubit_login_screen/login_screen_cubit.dart';
import 'package:nowapps/logic/textformfield_validator_mixin.dart';
import 'package:nowapps/presentation/screen_verifyotp.dart';
import 'package:nowapps/presentation/widgets/custom_image_card.dart';
import 'package:nowapps/presentation/widgets/custom_submitbutton.dart';
import 'package:nowapps/presentation/widgets/custom_textformfield.dart';
import 'package:nowapps/themedata.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class ScreenLogin extends StatelessWidget with TextFieldValidator {
  ScreenLogin({Key? key}) : super(key: key);

  static TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: Container(
        decoration: kboxdecoration,
        child: Scaffold(
          appBar: customAppBar('Login'),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                        'Please provide the registered mobile number',
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 10.w),
                        child: CustomTextFormField(
                            validator: (val) {
                              return isMobileValid(val);
                            },
                            hintText: 'Mobile number',
                            keyBoardType: TextInputType.number,
                            iconData: Icons.phone,
                            nextAction: TextInputAction.done,
                            textController: mobileNumberController),
                      ),
                    ),
                    BlocConsumer<LoginScreenCubit, LoginScreenState>(
                      listener: (context, state) {
                        if (state is LoginScreenLoaded) {
                          showSnackBar(text: 'otp sent', context: context);
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: BlocProvider.value(
                                    value: context.read<LoginScreenCubit>(),
                                    child: ScreenVerifyOTP(),
                                  )));
                        }
                        if (state is LoginScreenLoading) {
                          showSnackBar(
                              text: 'Checking phone number', context: context);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginScreenLoading) {
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
                              if (_formKey.currentState!.validate()) {
                                print('ready to api post');
                                context.read<LoginScreenCubit>().sendOtp();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 10.w),
                              child: const CustomSubmitButton(
                                  text: 'VERIFY OTP',
                                  bgColor: Colors.deepPurple),
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
        ),
      ),
    );
  }
}
