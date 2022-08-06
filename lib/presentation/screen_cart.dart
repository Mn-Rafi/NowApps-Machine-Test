import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/logic/bloc_cart_controll/cart_controll_bloc.dart';
import 'package:nowapps/repositories/database_services/database_services.dart';
import 'package:sizer/sizer.dart';

import 'package:nowapps/presentation/widgets/custom_productdetails_tile.dart';
import 'package:nowapps/presentation/widgets/custom_submitbutton.dart';
import 'package:nowapps/themedata.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kboxdecoration,
      child: Scaffold(
        appBar: customAppBar('Cart'),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartControllBloc, CartControllState>(
                builder: (context, state) {
                  if (state is CartControllerDetailsState) {
                    if (cartItems.isNotEmpty) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return CustomCartProductTile(
                            product: cartItems[index],
                            index: cartItems[index].id!,
                          );
                        },
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/c60fea3ac3aab2e82c2f7ea901ef55f6-removebg-preview.png',
                          width: 80.w,
                        ),
                        Text(
                          'No Items in Cart',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: isLightTheme(context)
                                ? kContentColorLightTheme
                                : kContentColorDarkTheme,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Loading details...',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kContentColorLightTheme,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 3.w, right: 3.w, bottom: 2.h, top: 0.5.h),
              child: Container(
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',
                                style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold)),
                            BlocBuilder<CartControllBloc, CartControllState>(
                              builder: (context, state) {
                                return Text(total.toString(),
                                    style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          if (cartItems.isNotEmpty) {
                            final getBox = GetStorage();
                            final retailer = getBox.read('retailer');
                            customShowDialogueTwo(
                              context,
                              'Success',
                              'Your order has been\nplaced succesfully',
                            );
                            await deleteCart();
                            context
                                .read<CartControllBloc>()
                                .add(DeleteCartEvent());
                          } else {
                            showSnackBar(
                                text: 'No Items in Cart', isError: true);
                          }
                        },
                        child: CustomSubmitButton(
                          text: 'Buy Now',
                          bgColor: kPrimaryColor,
                          height: 4.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
