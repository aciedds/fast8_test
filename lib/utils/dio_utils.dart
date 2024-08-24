import 'package:dio/dio.dart';

class DioUtils {
  const DioUtils._();

  static Future<Dio> client() async {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: {'Content-Type': 'application/json'},
    ));

    return dio;
  }
}
