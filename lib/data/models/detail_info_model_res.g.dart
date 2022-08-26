// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_info_model_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailInfoModelRes _$DetailInfoModelResFromJson(Map json) => DetailInfoModelRes(
      CPU: json['CPU'] as String,
      camera: json['camera'] as String,
      capacity:
          (json['capacity'] as List<dynamic>).map((e) => e as String).toList(),
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      isFavorites: json['isFavorites'] as bool,
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      sd: json['sd'] as String,
      ssd: json['ssd'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$DetailInfoModelResToJson(DetailInfoModelRes instance) =>
    <String, dynamic>{
      'CPU': instance.CPU,
      'camera': instance.camera,
      'capacity': instance.capacity,
      'color': instance.color,
      'id': instance.id,
      'images': instance.images,
      'isFavorites': instance.isFavorites,
      'price': instance.price,
      'rating': instance.rating,
      'sd': instance.sd,
      'ssd': instance.ssd,
      'title': instance.title,
    };
