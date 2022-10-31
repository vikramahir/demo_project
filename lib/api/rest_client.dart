import 'package:demo_project/utils/CustomInterceptors.dart';
import 'package:demo_project/utils/constant.dart';
import 'package:dio/dio.dart';

class RestClient {
  late Dio _dio;

  RestClient() {
    var options = BaseOptions(
      baseUrl: Constant.baseURL,
    );
    _dio = Dio(options);
    _dio.interceptors.add(CustomInterceptors());
  }

  Future<Response<dynamic>> get({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    return _dio.get(path, queryParameters: data).then((value) => value);
  }


  Future<Response<dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,

  }) {
    return _dio.post(path, data : data, queryParameters: queryParameters).then((value) => value);
  }
}
