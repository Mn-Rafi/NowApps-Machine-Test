import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/logic/bloc_cart_controll/cart_controll_bloc.dart';
import 'package:nowapps/repositories/database_services/database_services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'package:nowapps/presentation/helpers/constants.dart';
import 'package:nowapps/presentation/widgets/custom_cart_button.dart';
import 'package:nowapps/presentation/widgets/custom_submitbutton.dart';
import 'package:nowapps/repositories/models/product_model.dart';
import 'package:nowapps/repositories/models/product_response_model.dart';
import 'package:nowapps/themedata.dart';

class CustomProductDetailsTile extends StatelessWidget {
  final Products product;
  final int index;
  const CustomProductDetailsTile({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.prodImage!,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/alt_image.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            product.prodName!,
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          '₹${product.prodPrice}',
                          style: GoogleFonts.quicksand(
                              color: Colors.red,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        // CustomCartButton()
                        BlocBuilder<CartControllBloc, CartControllState>(
                          builder: (context, state) {
                            if (state is CartControllerDetailsState) {
                              if (inCartIDs.contains(index)) {
                                return CustomCartButton(
                                  index: index,
                                  product: Product(
                                    id: index,
                                    name: product.prodName,
                                    price: product.prodMrp!,
                                    image: product.prodImage!,
                                    quantity: '1',
                                  ),
                                );
                              }
                            }
                            return InkWell(
                              onTap: () {
                                final productDetails = Product(
                                  id: index,
                                  name: product.prodName,
                                  price: product.prodMrp!,
                                  image: product.prodImage!,
                                  quantity: '1',
                                );
                                context.read<CartControllBloc>().add(
                                    CartControllAddToCart(
                                        index: index, product: productDetails));
                              },
                              child: CustomSubmitButton(
                                  text: 'Add to cart',
                                  fontColr: Colors.black,
                                  fontSize: 13.sp,
                                  height: 3.5.h,
                                  width: 30.w,
                                  bgColor: Colors.white),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCartProductTile extends StatelessWidget {
  final Product product;
  final int index;
  const CustomCartProductTile({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/alt_image.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            product.name!,
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          '₹${product.price}',
                          style: GoogleFonts.quicksand(
                              color: Colors.red,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        // CustomCartButton()
                        BlocBuilder<CartControllBloc, CartControllState>(
                          builder: (context, state) {
                            if (state is CartControllerDetailsState) {
                              if (inCartIDs.contains(index)) {
                                return CustomCartButton(
                                  index: index,
                                  product: Product(
                                    id: index,
                                    name: product.name,
                                    price: product.price,
                                    image: product.image,
                                    quantity: '1',
                                  ),
                                );
                              }
                            }
                            return InkWell(
                              onTap: () {
                                final productDetails = Product(
                                  id: index,
                                  name: product.name,
                                  price: product.price,
                                  image: product.image,
                                  quantity: '1',
                                );
                                context.read<CartControllBloc>().add(
                                    CartControllAddToCart(
                                        index: index, product: productDetails));
                              },
                              child: CustomSubmitButton(
                                  text: 'Add to cart',
                                  fontColr: Colors.black,
                                  fontSize: 13.sp,
                                  height: 3.5.h,
                                  width: 30.w,
                                  bgColor: Colors.white),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProductDetailsTileShimmer extends StatelessWidget {
  const CustomProductDetailsTileShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: Image.network(shopImages[0]).image,
                    radius: 5.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company Name',
                            style: GoogleFonts.quicksand(
                                color: Colors.grey,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '₹3000',
                            style: GoogleFonts.quicksand(
                                color: Colors.grey,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                        width: 60.w,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 31.w,
                          ),
                          CustomSubmitButton(
                              text: 'Add to cart',
                              fontColr: Colors.black,
                              fontSize: 13.sp,
                              height: 3.5.h,
                              width: 30.w,
                              bgColor: Colors.white),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
