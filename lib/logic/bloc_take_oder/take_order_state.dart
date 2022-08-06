part of 'take_order_bloc.dart';

abstract class TakeOrderState extends Equatable {
  const TakeOrderState();

  @override
  List<Object> get props => [];
}

class TakeOrderInitial extends TakeOrderState {}

class TakeOrderFetching extends TakeOrderState {}

class TakeOrderError extends TakeOrderState {
  final String message;
  const TakeOrderError({required this.message});

  @override
  List<Object> get props => [message];
}

class TakeOrderFetched extends TakeOrderState {
  final ProductResponse productResponse;
  const TakeOrderFetched({required this.productResponse});

  @override
  List<Object> get props => [productResponse];
}
