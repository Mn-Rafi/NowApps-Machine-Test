import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:nowapps/presentation/screen_checkin.dart';
import 'package:nowapps/presentation/screen_login.dart';
import 'package:nowapps/presentation/screen_retailers.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  final getBox = GetStorage();
  SplashScreenCubit() : super(SplashScreenInitial()) {
    emit(SplashScreenLoading());
    Future.delayed(const Duration(seconds: 2), () {
      final String? value = getBox.read('navigation');
      if (value == null) {
        Get.off(ScreenLogin());
      } else if (value == '/retailers') {
        Get.off(const ScreenRetailersList());
      } else if (value == '/checkedin') {
        final retailer = getBox.read('retailer');
        Get.off(ScreenCheckIn(
          companyName: retailer,
        ));
      }
    });
  }
}
