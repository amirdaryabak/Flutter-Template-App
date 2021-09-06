

import 'package:flutter_template_app/data/network/rest/dio/dio_provider.dart';
import 'package:flutter_template_app/data/network/rest/services/rest_provider.dart';

abstract class BaseRepository {

  late RestProvider restProvider;

  BaseRepository() {
    var provider = DioProvider();
    restProvider = provider.restProvider;
  }

}