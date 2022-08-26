import 'package:ecommerce_project/data/main_provider.dart';
import 'package:ecommerce_project/data/models/main_info_model_res.dart';

class MainRepository {
  final MainProvider _mainProvider = MainProvider();

  Future<MainInfoModelRes> getMainInfo() => _mainProvider.getMainInfo();
}
