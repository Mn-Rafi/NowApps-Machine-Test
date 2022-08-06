import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps/presentation/screen_splash.dart';
import 'package:nowapps/repositories/database_services/database_services.dart';
import 'package:nowapps/repositories/product_listapi_services/product_listapi_services.dart';
import 'package:nowapps/themedata.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await GetStorage.init();
  await openDB();
  await Future.delayed(const Duration(milliseconds: 100));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceTYpe) {
      return RepositoryProvider(
        create: (context) => ProductListApiServices(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: darkThemeData(context),
          themeMode: ThemeMode.system,
          theme: lightThemeData(context),
          home: const ScreenSplash(),
        ),
      );
    });
  }
}
