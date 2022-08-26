import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/bloc/detail_bloc/detail_repository.dart';
import 'package:ecommerce_project/data/models/detail_info_model_res.dart';
import 'package:ecommerce_project/utils/error_handling.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository detailRepository;

  DetailBloc({
    required this.detailRepository,
  }) : super(DetailInitial()) {
    on<GetDetailInfoEvent>((event, emit) async {
      emit(DetailLoading());

      try {
        final DetailInfoModelRes response = await detailRepository.getDetailInfo();
        emit(DetailLoaded(detailInfoModelRes: response));
      } catch (e) {
        emit(DetailError(errorMessage: complainError(e)));
      }
    });
  }
}
