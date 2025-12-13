import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cycleiq_saas_mobile/core/error/exception.dart';
import 'package:cycleiq_saas_mobile/core/logger/app_logger.dart';

enum RequestType { get, post, put, delete, patch }

class NetworkClient {
  final Dio dio;
  final AppLogger logger;

  NetworkClient({required this.dio, required this.logger});

  Future<Response> invoke(
    String url,
    RequestType method, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic requestBody,
    ResponseType? responseType,
  }) async {
    try {
      final options = Options(
        headers: headers,
        responseType: responseType ?? ResponseType.json,
      );

      Response response;

      /// -------------------------------------
      /// 🔥 SEND HTTP CALL
      /// -------------------------------------
      switch (method) {
        case RequestType.get:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case RequestType.post:
          response = await dio.post(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: options,
          );
          break;
        case RequestType.put:
          response = await dio.put(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: options,
          );
          break;
        case RequestType.delete:
          response = await dio.delete(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: options,
          );
          break;
        case RequestType.patch:
          response = await dio.patch(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: options,
          );
          break;
      }

      /// -------------------------------------
      /// 🔥 HANDLE SUCCESS STATUS CODES
      /// -------------------------------------
      final code = response.statusCode ?? 0;
      if (code >= 200 && code < 300) {
        return response;
      }

      throw _createServerException(code, response);
    } on SocketException {
      /// -------------------------------------
      /// ❌ No Internet
      /// -------------------------------------
      throw NoInternetException(message: "No internet connection");
    } on DioException catch (dioErr) {
      logger.e("Dio Error → ${dioErr.message}", StackTrace.current);

      /// If server responded → use its status code
      if (dioErr.response != null) {
        final code = dioErr.response?.statusCode ?? 0;
        throw _createServerException(code, dioErr.response!, dioErr: dioErr);
      }

      /// If no response → treat as unknown server error
      throw ServerException(
        dioException: dioErr,
        message: "Unexpected server error",
        errorType: ErrorType.other,
      );
    }
  }

  /// ---------------------------------------------------------------
  /// 🔥 Map status code → Exception & ErrorType
  /// ---------------------------------------------------------------
  ServerException _createServerException(
    int code,
    Response response, {
    DioException? dioErr,
  }) {
    final message = _extractMessage(response);

    switch (code) {
      case 400:
        return ServerException(
          dioException:
              dioErr ?? DioException(requestOptions: response.requestOptions),
          message: message ?? "Bad Request",
          errorType: ErrorType.bedRequest,
        );

      case 401:
        return ServerException(
          dioException:
              dioErr ?? DioException(requestOptions: response.requestOptions),
          message: message ?? "Unauthorized access",
          errorType: ErrorType.unAuthorised,
        );

      case 403:
        return ServerException(
          dioException:
              dioErr ?? DioException(requestOptions: response.requestOptions),
          message: message ?? "Forbidden",
          errorType: ErrorType.forbidden,
        );

      case 404:
        return ServerException(
          dioException:
              dioErr ?? DioException(requestOptions: response.requestOptions),
          message: message ?? "Resource not found",
          errorType: ErrorType.other,
        );

      case 409:
        return ServerException(
          dioException:
              dioErr ?? DioException(requestOptions: response.requestOptions),
          message: message ?? "Conflict occurred",
          errorType: ErrorType.other,
        );

      case 422:
        return ServerException(
          dioException:
              dioErr ?? DioException(requestOptions: response.requestOptions),
          message: message ?? "Validation failed",
          errorType: ErrorType.dataParsing,
        );

      case 500:
      default:
        return ServerException(
          dioException:
              dioErr ?? DioException(requestOptions: response.requestOptions),
          message: message ?? "Server error ($code)",
          errorType: ErrorType.other,
        );
    }
  }

  /// ---------------------------------------------------------------
  /// 🔥 Extract message safely from backend response
  /// ---------------------------------------------------------------
  String? _extractMessage(Response response) {
    try {
      if (response.data is Map && response.data["message"] != null) {
        return response.data["message"];
      }
      return response.statusMessage;
    } catch (_) {
      return null;
    }
  }
}
