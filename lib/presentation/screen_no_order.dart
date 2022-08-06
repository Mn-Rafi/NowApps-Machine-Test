import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import 'package:nowapps/logic/cubit_no_order_screen/no_order_screen_cubit.dart';
import 'package:nowapps/presentation/screen_checkin.dart';
import 'package:nowapps/presentation/widgets/custom_reason_dropdownmenu.dart';
import 'package:nowapps/presentation/widgets/custom_submitbutton.dart';
import 'package:nowapps/themedata.dart';

class ScreenNoOrder extends StatelessWidget {
  final String companyName;
  ScreenNoOrder({
    Key? key,
    required this.companyName,
  }) : super(key: key);
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoOrderScreenCubit(),
      child: Container(
        decoration: kboxdecoration,
        child: Scaffold(
          appBar: customAppBar('No Order'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Reason*',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      BlocBuilder<NoOrderScreenCubit, NoOrderScreenState>(
                        builder: (context, state) {
                          return CustomDropdownmenuButton();
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Remarks*',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 4,
                            controller: _reasonController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write your remark...',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
                BlocConsumer<NoOrderScreenCubit, NoOrderScreenState>(
                  listener: (context, state) {
                    if (state is NoOrderScreenLoading) {
                      showSnackBar(
                          text: 'checking details...', context: context);
                    }
                    if (state is NoOrderScreenLoaded) {
                      showSnackBar(
                          text: 'Remark added succesfully', context: context);
                      final getBox = GetStorage();
                      getBox.write('reason', _reasonController.text);
                      // Navigator.of(context).pop();
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ScreenCheckIn(
                            companyName: companyName,
                          ),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is NoOrderScreenLoading) {
                      return const CustomLoadingSubmitButton(
                        text: 'SUBMIT',
                        bgColor: kdisabledColor,
                        width: double.infinity,
                      );
                    }
                    return InkWell(
                      onTap: () async {
                        if (_reasonController.text.isNotEmpty) {
                          await context
                              .read<NoOrderScreenCubit>()
                              .submitNorder(context);
                        } else {
                          showSnackBar(
                              text: 'Please provide a remark',
                              context: context,
                              isError: true,
                              duration: 2000);
                        }
                      },
                      child: const CustomSubmitButton(
                        text: 'SUBMIT',
                        bgColor: kPrimaryColor,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
