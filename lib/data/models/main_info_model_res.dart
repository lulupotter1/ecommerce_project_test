import "package:json_annotation/json_annotation.dart";

part 'main_info_model_res.g.dart';

@JsonSerializable(anyMap: true)
class MainInfoModelRes {
  List<MainInfoModelHomeStoreRes> home_store;
  List<MainInfoModelBestSellerRes> best_seller;

  MainInfoModelRes({
    required this.best_seller,
    required this.home_store,
  });

  factory MainInfoModelRes.fromJson(Map json) => _$MainInfoModelResFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoModelResToJson(this);
}

@JsonSerializable(anyMap: true)
class MainInfoModelHomeStoreRes {
  int id;
  bool is_new;
  String title;
  String subtitle;
  String picture;
  bool is_buy;

  MainInfoModelHomeStoreRes({
    required this.id,
    this.is_new = false,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.is_buy,
  });

  factory MainInfoModelHomeStoreRes.fromJson(Map json) => _$MainInfoModelHomeStoreResFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoModelHomeStoreResToJson(this);
}

@JsonSerializable(anyMap: true)
class MainInfoModelBestSellerRes {
  int id;
  bool is_favorites;
  String title;
  int price_without_discount;
  int discount_price;
  String picture;

  MainInfoModelBestSellerRes({
    required this.id,
    required this.is_favorites,
    required this.title,
    required this.price_without_discount,
    required this.discount_price,
    required this.picture,
  });

  factory MainInfoModelBestSellerRes.fromJson(Map json) => _$MainInfoModelBestSellerResFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoModelBestSellerResToJson(this);
}
