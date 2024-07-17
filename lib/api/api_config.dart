import 'package:dio/dio.dart';

class ApiConfig {
  static const baseUrl = 'http://localhost:8000'; //dev
  // static const baseUrl = 'https://eventapi.indomobil.co.id';//prod

  static const baseUrlForm = '/form';
  static const baseUrlContent = '/content';
}

Future<Response> request(String serviceUrl, String method, dynamic data) async {
  try {
    final dio = Dio();

    final request = await dio.request(
      ApiConfig.baseUrl + serviceUrl,
      options: Options(
        method: method,
        headers: {
          "content-type": "application/json",
        },
      ),
      data: data,
    );

    return request;
  } catch (e) {
    rethrow;
  }
}
