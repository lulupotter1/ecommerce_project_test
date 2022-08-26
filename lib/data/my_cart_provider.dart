import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/models/my_cart_model_res.dart';
import 'package:ecommerce_project/utils/constants.dart';

class MyCartProvider {
  final baseUrl = Constants.myCartScreenUrl;
  var dioMain = Dio(BaseOptions(
    connectTimeout: 4000,
    receiveTimeout: 10000,
    contentType: "application/json",
  ));

  Future<MyCartInfoModelRes> getMyCartInfo() async {
    final response = await dioMain.get(
      baseUrl,
    );
    return MyCartInfoModelRes.fromJson(response.data);
  }
}
