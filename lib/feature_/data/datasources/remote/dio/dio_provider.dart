import 'package:dio/dio.dart';
import 'package:flutter_template_app/feature_/data/datasources/remote/interceptors/authentication_interceptor.dart';
import 'package:flutter_template_app/feature_/data/datasources/remote/interceptors/logging_interceptor.dart';
import 'package:flutter_template_app/feature_/data/datasources/remote/news_api_service.dart';

class DioProvider {
  Dio dio;
  NewsApiService newsApiService;
  String accessToken;
  static final DioProvider _instance = DioProvider._internal();

  factory DioProvider() => _instance;

  DioProvider._internal() {
    dio = Dio(BaseOptions(connectTimeout: 20000, receiveTimeout: 20000))
      ..interceptors
          .addAll([LoggingInterceptor(), AuthenticationInterceptor()]);
    newsApiService = NewsApiService(dio);
  }
}
