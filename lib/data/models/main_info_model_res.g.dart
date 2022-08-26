// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_info_model_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainInfoModelRes _$MainInfoModelResFromJson(Map json) => MainInfoModelRes(
      best_seller: (json['best_seller'] as List<dynamic>)
          .map((e) => MainInfoModelBestSellerRes.fromJson(e as Map))
          .toList(),
      home_store: (json['home_store'] as List<dynamic>)
          .map((e) => MainInfoModelHomeStoreRes.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$MainInfoModelResToJson(MainInfoModelRes instance) =>
    <String, dynamic>{
      'home_store': instance.home_store,
      'best_seller': instance.best_seller,
    };

MainInfoModelHomeStoreRes _$MainInfoModelHomeStoreResFromJson(Map json) =>
    MainInfoModelHomeStoreRes(
      id: json['id'] as int,
      is_new: json['is_new'] as bool? ?? false,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      picture: json['picture'] as String,
      is_buy: json['is_buy'] as bool,
    );

Map<String, dynamic> _$MainInfoModelHomeStoreResToJson(
        MainInfoModelHomeStoreRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_new': instance.is_new,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'picture': instance.picture,
      'is_buy': instance.is_buy,
    };

MainInfoModelBestSellerRes _$MainInfoModelBestSellerResFromJson(Map json) =>
    MainInfoModelBestSellerRes(
      id: json['id'] as int,
      is_favorites: json['is_favorites'] as bool,
      title: json['title'] as String,
      price_without_discount: json['price_without_discount'] as int,
      discount_price: json['discount_price'] as int,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$MainInfoModelBestSellerResToJson(
        MainInfoModelBestSellerRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_favorites': instance.is_favorites,
      'title': instance.title,
      'price_without_discount': instance.price_without_discount,
      'discount_price': instance.discount_price,
      'picture': instance.picture,
    };
