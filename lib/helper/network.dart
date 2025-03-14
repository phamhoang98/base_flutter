import 'package:base_flutter/helper/local_storage.dart';
import 'package:dio/dio.dart';

import '../index.dart';

class NetWork {
  final dio = Dio()
    ..options.baseUrl = 'https://pub.dev'
    ..options.connectTimeout = const Duration(milliseconds: 3000)
    ..options.receiveTimeout = const Duration(milliseconds: 3000)
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Thêm header hoặc token vào mỗi yêu cầu
        AccessTokenModel? value = await LocalStorage().getAccessToken();
        if (value != null) {
          options.headers['Authorization'] = 'Bearer ${value.accessToken}';
        }
        print('Request to: ${options.baseUrl}${options.path}');
        return handler.next(options); // Chuyển tiếp yêu cầu
      },
      onResponse: (response, handler) {
        // Xử lý khi nhận phản hồi thành công
        print('Response: ${response.data}');
        return handler.next(response); // Chuyển tiếp phản hồi
      },
      onError: (DioException e, handler) {
        print('Request Error: ${e.message}');
        return handler.next(e); // Chuyển tiếp lỗi
      },
    ));

  Future<Response> getHttp({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    await headersApi();
    final response = await dio.get(
      url,
      queryParameters: queryParameters,
    );
    print(response);
    return response;
  }

  Future<Response> postHttp({
    required String url,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    await headersApi();
    final response = await dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
    print(response);
    return response;
  }

  Future<Response> putHttp({
    required String url,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    await headersApi();
    final response = await dio.put(
      url,
      queryParameters: queryParameters,
      data: data,
    );
    print(response);
    return response;
  }

  Future<Response> deleteHttp({
    required String url,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    await headersApi();
    final response = await dio.delete(
      url,
      queryParameters: queryParameters,
      data: data,
    );
    print(response);
    return response;
  }

  Future<void> headersApi() async {
    final tokenModel = await LocalStorage().getAccessToken();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer ${tokenModel?.accessToken}";
  }
}
