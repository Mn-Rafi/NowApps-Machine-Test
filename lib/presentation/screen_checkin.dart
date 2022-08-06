import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps/presentation/screen_no_order.dart';
import 'package:nowapps/presentation/screen_retailers.dart';
import 'package:nowapps/presentation/screen_takeorder.dart';
import 'package:nowapps/presentation/widgets/custom_menuitem.dart';

import 'package:nowapps/themedata.dart';
import 'package:page_transition/page_transition.dart';

class ScreenCheckIn extends StatelessWidget {
  final String companyName;
  ScreenCheckIn({
    Key? key,
    required this.companyName,
  }) : super(key: key);

  final getBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    final reason = getBox.read('reason');
    return Container(
      decoration: kboxdecoration,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to $companyName'),
          centerTitle: true,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomMenuItem(
              text: 'Take Order',
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: ScreenTakeOrder()));
              },
            ),
            CustomMenuItem(
              text: 'No Order',
              icon: Icons.remove_shopping_cart,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: ScreenNoOrder(
                          companyName: companyName,
                        )));
              },
            ),
            CustomMenuItem(
              text: 'Checkout',
              icon: Icons.logout,
              onTap: () {
                if (reason == null) {
                  showSnackBar(
                    text: 'Either Take an order \nor enter reason for no order',
                    context: context,
                    isError: true,
                  );
                } else {
                  customShowDialogue(context, 'Confirm Checkout!',
                      'Are you sure?\nYou really want to checkout?', () {
                    getBox.remove('reason');
                    getBox.write('navigation', '/retailers');
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: ScreenRetailersList()),
                      (route) => false,
                    );
                  });
                }
              },
              color: reason == null ? Colors.grey : kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
