// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart_model_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCartInfoModelRes _$MyCartInfoModelResFromJson(Map json) => MyCartInfoModelRes(
      basket: (json['basket'] as List<dynamic>)
          .map((e) => MyCartInfoBasketModelRes.fromJson(e as Map))
          .toList(),
      delivery: json['delivery'] as String,
      id: json['id'] as String,
      total: json['total'] as int,
    );

Map<String, dynamic> _$MyCartInfoModelResToJson(MyCartInfoModelRes instance) =>
    <String, dynamic>{
      'basket': instance.basket,
      'delivery': instance.delivery,
      'id': instance.id,
      'total': instance.total,
    };

MyCartInfoBasketModelRes _$MyCartInfoBasketModelResFromJson(Map json) =>
    MyCartInfoBasketModelRes(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      images: json['images'] as String,
    );

Map<String, dynamic> _$MyCartInfoBasketModelResToJson(
        MyCartInfoBasketModelRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'price': instance.price,
      'title': instance.title,
    };
