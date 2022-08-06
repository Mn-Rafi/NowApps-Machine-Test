import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nowapps/repositories/models/product_response_model.dart';

import 'package:nowapps/repositories/product_listapi_services/product_listapi_services.dart';

part 'take_order_event.dart';
part 'take_order_state.dart';

class TakeOrderBloc extends Bloc<TakeOrderEvent, TakeOrderState> {
  final ProductListApiServices _productListApiServices;
  TakeOrderBloc(
    this._productListApiServices,
  ) : super(TakeOrderInitial()) {
    on<TakeOrderEvent>((event, emit) async {
      emit(TakeOrderFetching());
      try {
        final response = await _productListApiServices.getProductDetails();
        if (response.statusCode == 200) {
          final productResponse = ProductResponse.fromJson(response.data);
          emit(TakeOrderFetched(productResponse: productResponse));
        } else {
          throw DioError;
        }
      } catch (e) {
        if (e is DioError) {
          emit(TakeOrderError(message: e.response!.data['message']));
        }
        log('error $e');
        emit(const TakeOrderError(message: 'Something went wrong'));
      }
    });
    add(const TakeOrderEvent());
  }
}
