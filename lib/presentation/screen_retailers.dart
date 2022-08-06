import 'package:flutter/material.dart';
import 'package:nowapps/presentation/widgets/custom_retailerstile.dart';

import 'package:nowapps/presentation/helpers/constants.dart';
import 'package:nowapps/themedata.dart';

class ScreenRetailersList extends StatelessWidget {
  const ScreenRetailersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kboxdecoration,
      child: Scaffold(
        appBar: customAppBar('Retailers'),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: shopNames.length,
          itemBuilder: (context, index) {
            return CustomRetailerTile(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
