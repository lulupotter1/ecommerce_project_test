import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String complainError(e) {
  debugPrint(e.runtimeType.toString());
  if (e is String) return e;

  if (e is DioError) {
    debugPrint(e.type.runtimeType.toString());
    debugPrint((e.type == DioErrorType.connectTimeout).toString());
    if (e.type == DioErrorType.connectTimeout) {
      return "Время соединения вышло";
    }
  }

  if (e is SocketException) return "Ошибка соединения с серверами, проверьте настройки Интернет";

  if (e is FormatException) {
    // looks like attempt to parse html as json
    return "Что-то пошло не так";
  }

  if (e is PlatformException && e.message != null) {
    return e.message!;
  }

  if (e.toString().contains("504")) return "Сервис временно недоступен";

  if (e.toString() == "Expected a value of type 'String', but got one of type 'Null'") {
    return "Ошибка для разработчика(Expected a value of type 'String', but got one of type 'Null')";
  }
  return e.toString();
}
