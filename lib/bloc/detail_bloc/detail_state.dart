part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final DetailInfoModelRes detailInfoModelRes;
  DetailLoaded({
    required this.detailInfoModelRes,
  });
}

class DetailError extends DetailState {
  final String errorMessage;
  DetailError({
    required this.errorMessage,
  });
}
