import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/repositories/database_services/database_services.dart';
import 'package:sizer/sizer.dart';

import 'package:nowapps/logic/bloc_cart_controll/cart_controll_bloc.dart';
import 'package:nowapps/repositories/models/product_model.dart';

class CustomCartButton extends StatelessWidget {
  final int index;
  final Product product;
  const CustomCartButton({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quantity = cartItems[inCartIDs.indexOf(index)].quantity;
    log('IDS : ${product.id}');
    return Container(
      alignment: Alignment.center,
      width: 30.w,
      height: 3.5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (quantity != '1')
            InkWell(
                onTap: () {
                  context.read<CartControllBloc>().add(
                      CartControllRemoveToCart(index: index, product: product));
                },
                child: Icon(Icons.remove)),
          InkWell(
            onTap: quantity == '1'
                ? () {
                    context.read<CartControllBloc>().add(
                        CartControllRemoveToCart(
                            index: index, product: product));
                  }
                : null,
            child: Text(
              quantity != '1' ? quantity : 'Remove',
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
          ),
          InkWell(
              onTap: () {
                context
                    .read<CartControllBloc>()
                    .add(CartControllAddToCart(index: index, product: product));
              },
              child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
