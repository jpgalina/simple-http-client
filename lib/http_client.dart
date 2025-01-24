import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:simple_http_client/models/api_error.model.dart';
import 'package:simple_http_client/models/http_response.model.dart';

class HttpClient {
  final Dio _dio = Dio();

  AsyncResultDart<HTTPResponse, APIError> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (_isStatusCodeValid(response.statusCode)) {
        return Success(
          HTTPResponse(
            statusCode: response.statusCode!,
            data: response.data,
          ),
        );
      }

      return Failure(
        APIError(
          message: response.statusMessage ?? '',
          statusCode: response.statusCode ?? 0,
          response: response.data,
        ),
      );
    } catch (e) {
      return Failure(APIError(message: e.toString(), statusCode: 0));
    }
  }

  AsyncResultDart<HTTPResponse, APIError> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (_isStatusCodeValid(response.statusCode)) {
        return Success(
          HTTPResponse(
            statusCode: response.statusCode!,
            data: response.data,
          ),
        );
      }

      return Failure(
        APIError(
          message: response.statusMessage ?? '',
          statusCode: response.statusCode ?? 0,
          response: response.data,
        ),
      );
    } catch (e) {
      return Failure(APIError(message: e.toString(), statusCode: 0));
    }
  }

  AsyncResultDart<HTTPResponse, APIError> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (_isStatusCodeValid(response.statusCode)) {
        return Success(
          HTTPResponse(
            statusCode: response.statusCode!,
            data: response.data,
          ),
        );
      }

      return Failure(
        APIError(
          message: response.statusMessage ?? '',
          statusCode: response.statusCode ?? 0,
          response: response.data,
        ),
      );
    } catch (e) {
      return Failure(APIError(message: e.toString(), statusCode: 0));
    }
  }

  AsyncResultDart<HTTPResponse, APIError> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (_isStatusCodeValid(response.statusCode)) {
        return Success(
          HTTPResponse(
            statusCode: response.statusCode!,
            data: response.data,
          ),
        );
      }

      return Failure(
        APIError(
          message: response.statusMessage ?? '',
          statusCode: response.statusCode ?? 0,
          response: response.data,
        ),
      );
    } catch (e) {
      return Failure(APIError(message: e.toString(), statusCode: 0));
    }
  }

  AsyncResultDart<HTTPResponse, APIError> patch(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (_isStatusCodeValid(response.statusCode)) {
        return Success(
          HTTPResponse(
            statusCode: response.statusCode!,
            data: response.data,
          ),
        );
      }

      return Failure(
        APIError(
          message: response.statusMessage ?? '',
          statusCode: response.statusCode ?? 0,
          response: response.data,
        ),
      );
    } catch (e) {
      return Failure(APIError(message: e.toString(), statusCode: 0));
    }
  }

  bool _isStatusCodeValid(int? statusCode) {
    return statusCode != null ? statusCode >= 200 && statusCode < 300 : false;
  }
}
