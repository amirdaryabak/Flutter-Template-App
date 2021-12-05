import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    print(
        'REQUEST ${options.method} => PATH: ${options.path} DATA: ${options.data}'
        'HEADER ${options.headers}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
      'RESPONSE${response.statusCode} => PATH: ${response.request.path}'
      'DATA: ${response.toString()} STATUS:${response.statusMessage}'
      'HEADER ${response.headers}',
    );
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(
        'ERROR${err.error} => PATH: ${err.request.path} CODE: ${err.response?.statusCode}');
    return super.onError(err);
  }
}
