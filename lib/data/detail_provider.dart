import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/models/detail_info_model_res.dart';
import 'package:ecommerce_project/utils/constants.dart';

class DetailProvider {
  final baseUrl = Constants.detailScreenUrl;
  var dioMain = Dio(BaseOptions(
    connectTimeout: 4000,
    receiveTimeout: 10000,
    contentType: "application/json",
  ));

  Future<DetailInfoModelRes> getDetailInfo() async {
    final response = await dioMain.get(
      baseUrl,
    );
    return DetailInfoModelRes.fromJson(response.data);
  }
}
