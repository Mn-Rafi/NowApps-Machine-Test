import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/presentation/helpers/constants.dart';
import 'package:nowapps/presentation/screen_checkin.dart';
import 'package:nowapps/presentation/widgets/custom_submitbutton.dart';
import 'package:nowapps/themedata.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class CustomRetailerTile extends StatelessWidget {
  final int index;
  const CustomRetailerTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      retailersList[index].imagePath,
                      width: 30.w,
                      height: 15.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      retailersList[index].name,
                      style: GoogleFonts.quicksand(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      retailersList[index].ownerName,
                      style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      retailersList[index].address,
                      style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      retailersList[index].phone,
                      style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () async {
                            customShowDialogue(context, 'Check In',
                                'Are you sure\nYou want to check in to ${retailersList[index].name}?',
                                () async {
                              final getBox = GetStorage();
                              await getBox.write(
                                  'retailer', retailersList[index].name);
                              await getBox
                                  .write('navigation', '/checkedin')
                                  .then((value) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: ScreenCheckIn(
                                      companyName: retailersList[index].name,
                                    ),
                                  ),
                                  (route) => false,
                                );
                                return null;
                              });
                            });
                          },
                          child: CustomSubmitButton(
                            text: 'Check In',
                            fontSize: 12.sp,
                            borderRadius: 1.w,
                            bgColor: kContentColorLightTheme,
                            width: 35.w,
                            height: 3.h,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
