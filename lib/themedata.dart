import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

const kPrimaryColor = Color.fromARGB(255, 39, 39, 39);
const kdisabledColor = Color.fromARGB(255, 200, 200, 200);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

AppBar customAppBar(
  String title,
) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: kContentColorLightTheme,
  );
}

bool isLightTheme(BuildContext context) {
  bool isLighttheme =
      MediaQuery.of(context).platformBrightness == Brightness.light
          ? true
          : false;
  return isLighttheme;
}

showSnackBar(
    {required String text,
    BuildContext? context,
    int? duration,
    bool? isError = false}) async {
  if (Get.isSnackbarOpen) {
    await Get.closeCurrentSnackbar().then((value) {
      Get.snackbar('Message', text,
          backgroundColor: isError! ? Colors.red : Colors.green,
          duration: Duration(milliseconds: duration ?? 600));
    });
  } else {
    Get.snackbar('Message', text,
        backgroundColor: isError! ? Colors.red : Colors.green,
        duration: Duration(seconds: duration ?? 1));
  }
}

customShowDialogue(BuildContext context, String title, String content,
    VoidCallback? onPressed) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: onPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}

customShowDialogueTwo(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

const userHive = 'userHive';

final List<String> imageList = [
  'images/add_image_icon.png',
  'images/circle_avatar.jpg',
  'images/gender_icon.png',
  'images/one_health_logo.png',
  'images/sign_with_otp.jpg',
  'images/signin_or_register.jpg',
  'images/signin.jpg'
];

final kDefaultPaddingheight = 4.h;
final kDefaultPaddingwidth = 7.w;
const BoxDecoration kboxdecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)]));

final mainHeaderStyle = GoogleFonts.exo(
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
);

final normalTextStyle = GoogleFonts.ubuntu(color: Colors.grey[800]);
final normalTextStyledark =
    GoogleFonts.ubuntu(color: const Color.fromARGB(255, 197, 197, 197));

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white.withOpacity(0.5),
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme.withOpacity(0.9),
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.black),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    dialogBackgroundColor: kContentColorDarkTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
