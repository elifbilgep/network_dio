import 'package:dio/dio.dart';

import 'api/constant/end_points.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json;
  }

  Future<Response> get(
    String url, {
    // Whenever we want to make a get request we need to pass that path from which we want a response back.
    Map<String, dynamic>?
        queryParameters, // You can efine different query parameters if that is the case in your project. For example in some cases, the path could be https://abcapi.com/user?name=xyz.. Here name is the query parameter and you can pass this parameter in queryParameter in Map format {'name': "xyz"}
    Options?
        options, // describes the http request information and configuration. can be passed basic configuraitons like Headers, Method Type, Content-Type, Repsonse Type etc...
    CancelToken?
        cancelToken, // You can cancel a request by using cancelToken. One token can be shared with different requests. When a token's cancel method is invoked all requests with this token will be cancelled
    ProgressCallback?
        onReceiveCallback, // This is the callback whic is used to listen the progress of sending/receiving the data.  It has two parameters: count: Indicates the length of the bytes that have been  sent/received, total: indicates the length of the body /repsonse
  }) async {
    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveCallback);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onReceiveProgress,
          onReceiveProgress: onReceiveProgress);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
