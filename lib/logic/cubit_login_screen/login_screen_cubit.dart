import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final getBox = GetStorage();
  LoginScreenCubit() : super(LoginScreenInitial()) {
    emit(LoginScreenInitial());
  }
  submitLogin() async {
    emit(VerifyScreenLoading());
    await Future.delayed(const Duration(seconds: 3)).then((value) async {
      await getBox.write('navigation', '/retailers');
      emit(VerifyScreenLoaded());
    });
  }

  sendOtp() async {
    emit(LoginScreenLoading());
    await Future.delayed(const Duration(seconds: 3)).then((value) async {
      emit(LoginScreenLoaded());
    });
  }
}
