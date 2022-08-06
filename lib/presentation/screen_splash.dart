import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowapps/logic/cubit_splash_screen/splash_screen_cubit.dart';
import 'package:nowapps/themedata.dart';
import 'package:sizer/sizer.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit(),
      child: Container(
        decoration: kboxdecoration,
        child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
          builder: (context, state) {
            return Scaffold(
                body: Center(
                    child: ZoomIn(
                        duration: const Duration(milliseconds: 600),
                        child: Image.asset(
                          'assets/channelkonnect_logo_white.png',
                          width: 60.w,
                        ))));
          },
        ),
      ),
    );
  }
}
