import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/bloc/my_cart_bloc/my_cart_repository.dart';
import 'package:ecommerce_project/data/models/my_cart_model_res.dart';
import 'package:ecommerce_project/utils/error_handling.dart';
import 'package:meta/meta.dart';

part 'my_cart_event.dart';
part 'my_cart_state.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  final MyCartRepository myCartRepository;

  MyCartBloc({
    required this.myCartRepository,
  }) : super(MyCartInitial()) {
    on<GetMyCartInfoEvent>((event, emit) async {
      emit(MyCartLoading());

      try {
        final MyCartInfoModelRes response = await myCartRepository.getMyCartInfo();
        emit(MyCartLoaded(myCartInfoModelRes: response));
      } catch (e) {
        emit(MyCartError(errorMessage: complainError(e)));
      }
    });
  }
}
