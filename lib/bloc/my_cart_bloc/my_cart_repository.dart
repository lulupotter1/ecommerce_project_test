import 'package:ecommerce_project/data/models/my_cart_model_res.dart';
import 'package:ecommerce_project/data/my_cart_provider.dart';

class MyCartRepository {
  final MyCartProvider _myCartProvider = MyCartProvider();

  Future<MyCartInfoModelRes> getMyCartInfo() => _myCartProvider.getMyCartInfo();
}
