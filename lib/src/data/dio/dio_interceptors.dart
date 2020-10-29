import 'package:dio/dio.dart';

class DioInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  DioInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    print(
        "--> ON REQUEST ${options.method != null ? options.method.toUpperCase() : 'METHOD'} "
        "${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));

    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    return options;
  }

  @override
  Future onResponse(Response response) {
    print(
        "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");

    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError dioError) async {
    print(
        "<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    print("<-- End error");

    if (dioError.error != DioErrorType.CONNECT_TIMEOUT) {
      /*if (isLogged) {
        if (dioError.response.statusCode == 401 &&
            _sharedPreferencesHelper != null) {
          _dio.interceptors.requestLock.lock();
          _dio.interceptors.responseLock.lock();

          await _sharedPreferencesHelper.saveLog(false);
          await _sharedPreferencesHelper.removeAuthToken();

          RequestOptions options = dioError.response.request;

          _dio.interceptors.requestLock.unlock();
          _dio.interceptors.responseLock.unlock();

          return _dio.request(options.path, options: options);
        }
      } else {
        super.onError(dioError);
      }*/
    } else {
      super.onError(dioError);
    }
  }
}
