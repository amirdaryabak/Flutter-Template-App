import 'package:flutter_template_app/feature_/data/datasources/remote/dio/dio_provider.dart';
import 'package:flutter_template_app/feature_/data/datasources/remote/news_api_service.dart';

abstract class BaseRepository {

  NewsApiService newsApiService;

  BaseRepository() {
    var provider = DioProvider();
    newsApiService = provider.newsApiService;
  }

}