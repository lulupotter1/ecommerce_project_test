import "package:json_annotation/json_annotation.dart";

part 'my_cart_model_res.g.dart';

@JsonSerializable(anyMap: true)
class MyCartInfoModelRes {
  List<MyCartInfoBasketModelRes> basket;
  String delivery;
  String id;
  int total;
  MyCartInfoModelRes({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  factory MyCartInfoModelRes.fromJson(Map json) => _$MyCartInfoModelResFromJson(json);

  Map<String, dynamic> toJson() => _$MyCartInfoModelResToJson(this);
}

@JsonSerializable(anyMap: true)
class MyCartInfoBasketModelRes {
  int id;

  String images;
  int price;
  String title;

  MyCartInfoBasketModelRes({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
  });

  factory MyCartInfoBasketModelRes.fromJson(Map json) => _$MyCartInfoBasketModelResFromJson(json);

  Map<String, dynamic> toJson() => _$MyCartInfoBasketModelResToJson(this);
}
