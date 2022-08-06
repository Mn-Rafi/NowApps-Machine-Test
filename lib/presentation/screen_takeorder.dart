import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps/logic/bloc_cart_controll/cart_controll_bloc.dart';
import 'package:nowapps/logic/bloc_take_oder/take_order_bloc.dart';
import 'package:nowapps/presentation/screen_cart.dart';
import 'package:nowapps/presentation/screen_checkin.dart';
import 'package:nowapps/presentation/widgets/custom_productdetails_tile.dart';
import 'package:nowapps/repositories/product_listapi_services/product_listapi_services.dart';
import 'package:nowapps/themedata.dart';
import 'package:page_transition/page_transition.dart';

class ScreenTakeOrder extends StatelessWidget {
  ScreenTakeOrder({Key? key}) : super(key: key);
  final getBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TakeOrderBloc(
            RepositoryProvider.of<ProductListApiServices>(context),
          ),
        ),
        BlocProvider(
          create: (context) => CartControllBloc(),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          final retailer = await getBox.read('retailer');
          Get.offAll(ScreenCheckIn(companyName: retailer));
          return false;
        },
        child: Container(
          decoration: kboxdecoration,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Take Order'),
              leading: InkWell(
                  onTap: () async {
                    final retailer = await getBox.read('retailer');
                    Get.offAll(ScreenCheckIn(companyName: retailer));
                  },
                  child: const Icon(Icons.arrow_back_rounded)),
              centerTitle: true,
              actions: [
                BlocBuilder<CartControllBloc, CartControllState>(
                  builder: (context, state) {
                    if (state is CartControllerDetailsState) {
                      return cartIcon(context, state.cartItemsCount.toString(),
                          onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: BlocProvider.value(
                                  value: BlocProvider.of<CartControllBloc>(
                                      context),
                                  child: const ScreenCart(),
                                )));
                      });
                    }
                    return cartIcon(context, '0', onPressed: () {});
                  },
                ),
              ],
            ),
            body: BlocBuilder<TakeOrderBloc, TakeOrderState>(
              builder: (context, state) {
                if (state is TakeOrderFetched) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.productResponse.data!.products!.length,
                      itemBuilder: (context, index) {
                        return CustomProductDetailsTile(
                          product: state.productResponse.data!.products![index],
                          index: index,
                        );
                      });
                }
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const CustomProductDetailsTileShimmer();
                    });
              },
            ),
          ),
        ),
      ),
    );
  }

  Padding cartIcon(context, count, {required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.shopping_cart_outlined),
            iconSize: 35,
          ),
          if (count != '0')
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 9,
              child: Text(
                count,
                style: const TextStyle(fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }
}
