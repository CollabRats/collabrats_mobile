import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class HttpService {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  // Base URL of the API
  final String _baseUrl = "https://www.google.com";

  HttpService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = Duration(seconds: 3); // 3 seconds

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Log the request details
          _logger.i("Request [${options.method}] ${options.uri}");
          _logger.i("Headers: ${options.headers}");
          _logger.i("Request Body: ${options.data}");

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Log the response details
          _logger.i(
            "Response [${response.statusCode}] ${response.requestOptions.uri}",
          );
          _logger.i("Response Body: ${response.data}");

          return handler.next(response);
        },
        onError: (DioError error, handler) {
          // Log the error details
          _logger.e(
            "Error [${error.response?.statusCode}] ${error.requestOptions.uri}",
          );
          _logger.e("Error Message: ${error.message}");

          return handler.next(error);
        },
      ),
    );
  }

  // GET request
  Future<Response> get(String endpoint) async {
    return Response(
      requestOptions: RequestOptions(path: endpoint),
      statusCode: 500,
      data: {"error": "An error occurred while processing the request."},
    );
  }

  // POST request
  Future<Response> post(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response; // Always return the actual response
    } on DioException catch (e) {
      rethrow; // Re-throw DioException so the caller can handle it
    } catch (e) {
      // Handle unexpected errors (e.g., parsing issues)
      throw Exception("Unexpected error: $e");
    }
  }

  // PUT request
  Future<Response> put(String endpoint, dynamic data) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500,
        data: {"error": "An error occurred while processing the PUT request."},
      );
    }
  }

  // DELETE request
  Future<Response> delete(String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500,
        data: {
          "error": "An error occurred while processing the DELETE request.",
        },
      );
    }
  }
}
