part of 'login_screen_cubit.dart';

@immutable
abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenLoaded extends LoginScreenState {}

class VerifyScreenLoading extends LoginScreenState {}

class VerifyScreenLoaded extends LoginScreenState {}
