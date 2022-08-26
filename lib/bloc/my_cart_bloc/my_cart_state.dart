part of 'my_cart_bloc.dart';

@immutable
abstract class MyCartState {}

class MyCartInitial extends MyCartState {}

class MyCartLoading extends MyCartState {}

class MyCartLoaded extends MyCartState {
  final MyCartInfoModelRes myCartInfoModelRes;
  MyCartLoaded({
    required this.myCartInfoModelRes,
  });
}

class MyCartError extends MyCartState {
  final String errorMessage;
  MyCartError({
    required this.errorMessage,
  });
}
