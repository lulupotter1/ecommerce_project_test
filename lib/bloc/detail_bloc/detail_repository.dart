import 'package:ecommerce_project/data/detail_provider.dart';
import 'package:ecommerce_project/data/models/detail_info_model_res.dart';

class DetailRepository {
  final DetailProvider _detailProvider = DetailProvider();

  Future<DetailInfoModelRes> getDetailInfo() => _detailProvider.getDetailInfo();
}
