import 'package:flutter/material.dart';
import 'package:nowapps/themedata.dart';
import 'package:sizer/sizer.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    Key? key,
    required this.text,
    required this.icon,
    this.onTap,
    this.color = kPrimaryColor,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30.sp,
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(text,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isLightTheme(context)
                      ? kContentColorLightTheme
                      : kContentColorDarkTheme,
                )),
          ],
        ),
      ),
    );
  }
}
