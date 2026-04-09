import 'package:dio/dio.dart';
import "api_constants.dart";

class ApiClient {
  late Dio _dio;

  // Cấu hình các thông số cơ bản cho Dio
  ApiClient() {

    // Khởi tạo Dio với các tùy chọn cơ bản
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        contentType: 'application/json',
        responseType: ResponseType.json,
        ),
      );

    // Thêm interceptor để log các request và response (tuỳ chọn)
    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       print('Request: ${options.method} ${options.path}');
    //       return handler.next(options);
    //     },
    //     onResponse: (response, handler) {
    //       print('Response: ${response.statusCode} ${response.data}');
    //       return handler.next(response);
    //     },
    //     onError: (DioError e, handler) {
    //       print('Error: ${e.message}');
    //       return handler.next(e);
    //     },
    //   ),
    // );
    
  }

  Dio get dio => _dio;
}