import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/models/main_info_model_res.dart';
import 'package:ecommerce_project/utils/constants.dart';

class MainProvider {
  final baseUrl = Constants.mainScreenUrl;
  var dioMain = Dio(BaseOptions(
    connectTimeout: 4000,
    receiveTimeout: 10000,
    contentType: "application/json",
  ));

  Future<MainInfoModelRes> getMainInfo() async {
    final response = await dioMain.get(
      baseUrl,
    );
    return MainInfoModelRes.fromJson(response.data);
  }
}
