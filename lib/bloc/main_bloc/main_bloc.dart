import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/bloc/main_bloc/main_repository.dart';
import 'package:ecommerce_project/utils/error_handling.dart';
import 'package:ecommerce_project/data/main_provider.dart';
import 'package:ecommerce_project/data/models/main_info_model_res.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository mainRepository;

  MainBloc({
    required this.mainRepository,
  }) : super(MainInitial()) {
    on<GetMainInfoEvent>((event, emit) async {
      emit(MainLoading());

      try {
        final MainInfoModelRes response = await mainRepository.getMainInfo();
        emit(MainLoaded(mainInfoModelRes: response));
      } catch (e) {
        emit(MainError(errorMessage: complainError(e)));
      }
    });
  }
}
