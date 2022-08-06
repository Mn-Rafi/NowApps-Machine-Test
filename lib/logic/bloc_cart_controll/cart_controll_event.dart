part of 'cart_controll_bloc.dart';

class CartControllEvent extends Equatable {
  const CartControllEvent();

  @override
  List<Object> get props => [];
}

class CartControllAddToCart extends CartControllEvent {
  final Product product;
  final int index;
  const CartControllAddToCart({
    required this.product,
    required this.index,
  });

  @override
  List<Object> get props => [product, index];
}

class DeleteCartEvent extends CartControllEvent {}

class CartControllRemoveToCart extends CartControllEvent {
  final Product product;
  final int index;
  const CartControllRemoveToCart({
    required this.product,
    required this.index,
  });

  @override
  List<Object> get props => [product];
}
