import 'package:dio/dio.dart';
import 'package:flutter_36kr/config/config.dart';

class HttpUtil {
  static HttpUtil _instance;
  static Dio _dio;
  static BaseOptions _options;

  static HttpUtil getInstance() {
    print("getInstance");
    if (_instance == null) {
      _instance = new HttpUtil();
    }

    return _instance;
  }

  HttpUtil() {
    _options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: Config.connectTimeout,
      receiveTimeout: Config.receiveTimeout
    );

    _dio = new Dio(_options);

    //设置拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return options;
      },
      onResponse: (Response response) {
        return response;
      },
      onError: (DioError e) {
        return e;
      }
    ));
    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  get(String url, {
    Map<String, String> data, 
    Options options, 
    CancelToken cancelToken
    }) async {
      Response response;
      try {
        if (data != null && data.isNotEmpty) {
          response = await _dio.get(url, queryParameters: data);
        } else {
          response = await _dio.get(url);
        }

        return response.data;
      } on DioError catch(e) {
        if (CancelToken.isCancel(e)) {
          print("get 请求取消" + e.message);
        } else {
          print("get 请求发送错误: $e");
        }
      }
  }

  post(String url, {
    Map<String, String> data, 
    Options options, 
    CancelToken cancelToken
    }) async {
      Response response;
      try {
        if (data != null && data.isNotEmpty) {
          response = await _dio.post(url, data: data);
        } else {
          response = await _dio.post(url);
        }

        return response.data;
      } on DioError catch(e) {
        if (CancelToken.isCancel(e)) {
          print("post 请求取消" + e.message);
        } else {
          print("post 请求发送错误: $e");
        }
      }
  }
}