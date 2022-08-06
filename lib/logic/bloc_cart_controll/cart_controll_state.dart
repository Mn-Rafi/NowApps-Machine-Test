part of 'cart_controll_bloc.dart';

abstract class CartControllState extends Equatable {
  const CartControllState();

  @override
  List<Object> get props => [];
}

class CartControllInitial extends CartControllState {}

class CartControllerDetailsState extends CartControllState {
  final List<Product> cartItems;
  final int cartItemsCount;
  final double totalPrice;
  const CartControllerDetailsState({
    required this.cartItems,
    required this.cartItemsCount,
    required this.totalPrice,
  });
  @override
  List<Object> get props => [cartItems, cartItemsCount];
}
