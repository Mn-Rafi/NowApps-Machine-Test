part of 'no_order_screen_cubit.dart';

@immutable
abstract class NoOrderScreenState {}

class NoOrderScreenInitial extends NoOrderScreenState {}

class NoOrderScreenDropdownChange extends NoOrderScreenState {}

class NoOrderScreenLoading extends NoOrderScreenState {}

class NoOrderScreenLoaded extends NoOrderScreenState {}
