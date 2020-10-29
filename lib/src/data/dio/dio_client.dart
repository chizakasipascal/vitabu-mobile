import 'package:dio/dio.dart';

import '../network_exception.dart';
import 'dio_interceptors.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.connectTimeout = 15000;
    _dio.options.receiveTimeout = 60000;
    _dio.interceptors.add(DioInterceptors(_dio));
  }

  Future<dynamic> get(String url,
      {Options options,
      CancelToken cancelToken,
      ProgressCallback onReceiveProgress}) async {
    return _dio
        .get(url,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress)
        .then((response) {
      final result = response.data;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Erreur du serveur", statusCode: statusCode);
      }

      print("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(
          message: "Erreur lors de la connection", statusCode: 504);
    });
  }

  Future<dynamic> post(String url,
      {data,
      Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress}) async {
    return _dio
        .post(url,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((response) {
      final result = response.data;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Erreur lors de la récupération des données du serveur",
            statusCode: statusCode);
      }

      print("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(
          message: "Erreur lors de la connection", statusCode: 504);
    });
  }

  Future<dynamic> put(String url,
      {data,
      Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress}) async {
    return _dio
        .put(url,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((response) {
      final result = response.data;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Erreur lors de la récupération des données du serveur",
            statusCode: statusCode);
      }

      print("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(
          message: "Erreur lors de la connection", statusCode: 504);
    });
  }

  Future<dynamic> patch(String url,
      {data,
      Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress}) async {
    return _dio
        .patch(url,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((response) {
      final result = response.data;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Erreur lors de la récupération des données du serveur",
            statusCode: statusCode);
      }

      print("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(
          message: "Erreur lors de la connection", statusCode: 504);
    });
  }
}
