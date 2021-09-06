import 'dart:async';
import 'package:flutter_template_app/core/constants/general.dart';
import 'package:flutter_template_app/data/network/dto/config/config_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_provider.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RestProvider {
  factory RestProvider(Dio dio, {String baseUrl}) = _RestProvider;

  @GET("")
  Future<ConfigDto> config();
}
