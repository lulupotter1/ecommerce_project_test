import "package:json_annotation/json_annotation.dart";

part 'detail_info_model_res.g.dart';

@JsonSerializable(anyMap: true)
class DetailInfoModelRes {
  String CPU;
  String camera;
  List<String> capacity;
  List<String> color;
  String id;
  List<String> images;
  bool isFavorites;
  int price;
  double rating;
  String sd;
  String ssd;
  String title;

  DetailInfoModelRes({
    required this.CPU,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });

  factory DetailInfoModelRes.fromJson(Map json) => _$DetailInfoModelResFromJson(json);

  Map<String, dynamic> toJson() => _$DetailInfoModelResToJson(this);
}
