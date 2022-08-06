// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps/repositories/database_services/database_services.dart';
import 'package:nowapps/repositories/models/product_model.dart';
import 'package:nowapps/themedata.dart';

part 'cart_controll_event.dart';
part 'cart_controll_state.dart';

class CartControllBloc extends Bloc<CartControllEvent, CartControllState> {
  CartControllBloc() : super(CartControllInitial()) {
    on<CartControllEvent>((event, emit) async {
      await qtyChanger();
      emit(CartControllerDetailsState(
        cartItems: cartItems,
        cartItemsCount: cartItems.length,
        totalPrice: total,
      ));
    });
    on<CartControllAddToCart>((event, emit) async {
      await addToCart(event.product, event.index);
      await qtyChanger();
      emit(CartControllerDetailsState(
        cartItems: cartItems,
        cartItemsCount: cartItems.length,
        totalPrice: total,
      ));

      showSnackBar(
        text: 'Product Added to cart',
      );
    });
    on<CartControllRemoveToCart>((event, emit) async {
      await decreaseQty(productID: event.product.id!);
      await qtyChanger();
      emit(CartControllerDetailsState(
        cartItems: cartItems,
        cartItemsCount: cartItems.length,
        totalPrice: total,
      ));

      showSnackBar(
        text: 'Product removed from the cart',
      );
    });
    on<DeleteCartEvent>((event, emit) async {
      await deleteCart();
      final getBox = GetStorage();
      await getBox.write('reason', '/cart_clean');
      add(const CartControllEvent());
    });
    add(const CartControllEvent());
  }
}
