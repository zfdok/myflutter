import 'package:dio/dio.dart';
import './http_config.dart';

class HttpRequest {
  static BaseOptions baseOptions = //基础选项
      BaseOptions(baseUrl: BASE_URL, connectTimeout: TIMEOUT);
  //1. 创建dio实例
  static final dio = Dio(baseOptions); //创建实例

  //类的request函数异步返回一个
  static Future request(String url,
      {String method = 'get', Map<String, dynamic> params}) async {
//用static 修饰,使之成为类方法,可以直接类调用

    //2. 请求
    Options options = Options(method: method); //本次请求的选项
    try {
      final result =
          await dio.request(url, queryParameters: params, options: options);
      return result;
    } catch (e) {
      throw e;
    }
  }
}