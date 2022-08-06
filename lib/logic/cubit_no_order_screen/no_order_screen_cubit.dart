import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'no_order_screen_state.dart';

class NoOrderScreenCubit extends Cubit<NoOrderScreenState> {
  NoOrderScreenCubit() : super(NoOrderScreenInitial());

  dropDownChange() {
    emit(NoOrderScreenDropdownChange());
    emit(NoOrderScreenInitial());
  }

  submitNorder(context) async {
    emit(NoOrderScreenLoading());
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      emit(NoOrderScreenLoaded());
    });
  }
}
