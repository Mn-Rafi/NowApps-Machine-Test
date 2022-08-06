import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomImageCard extends StatelessWidget {
  final String imagePath;
  final double ratio;
  final double? width;
  const CustomImageCard({
    Key? key,
    required this.imagePath,
    required this.ratio,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Image.asset(
          imagePath,
          height: 25.h,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
