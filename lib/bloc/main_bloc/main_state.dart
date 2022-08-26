part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  final MainInfoModelRes mainInfoModelRes;
  MainLoaded({
    required this.mainInfoModelRes,
  });
}

class MainError extends MainState {
  final String errorMessage;
  MainError({
    required this.errorMessage,
  });
}
