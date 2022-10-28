import 'package:demo_project/utils/CustomInterceptors.dart';
import 'package:dio/dio.dart';

class RestClient {
  final _endPoint;
  late Dio _dio;

  RestClient(this._endPoint) {
    var options = BaseOptions(
      baseUrl: _endPoint,
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
}
