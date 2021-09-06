

import 'package:flutter_template_app/core/base/api_wrapper.dart';
import 'package:flutter_template_app/core/base/base_repository.dart';
import 'package:flutter_template_app/core/exceptions/network_exceptions.dart';
import 'package:flutter_template_app/data/network/dto/config/config_dto.dart';

class SplashRepository extends BaseRepository{

  Future<ApiWrapper<ConfigDto>> config(String serverHost) async {
    try {
      var config = await restProvider.config();
      return ApiWrapper.success(data: config);
    } catch (error) {
      return ApiWrapper.failure(error: NetworkExceptions.getDioException(error));
    }
  }

}