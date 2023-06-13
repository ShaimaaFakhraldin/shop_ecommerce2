import 'package:dio/dio.dart';
class DioHelper{
  static late Dio dio ;

  static init (){
     dio = Dio(BaseOptions(
       baseUrl: "https://dummyjson.com/",
       receiveDataWhenStatusError:  true,
       headers: {"Content-Type" :"application/json"}


     ));
  }


  static Future<Response> getData (
      { required String url,
     required Map<String, dynamic> query,
     required Map<String, dynamic> header}) async {
  dio.options.headers = header ;

   return await dio.get(url ,queryParameters: query);
  }


  static Future<Response> postData (
      { required String url,
     required Map<String, dynamic> data,
      Map<String, dynamic>? query,
       Map<String, dynamic>? header}) async {
    dio.options.headers = header ;

    return await dio.post(url  ,data:  data,queryParameters: query);
  }

  static Future<Response> pustData (
      { required String url,
        required Map<String, dynamic> data,
        required Map<String, dynamic> query,
        required  Map<String, dynamic> header}) async {
    dio.options.headers = header ;

    return await dio.put(url  ,data:  data,queryParameters: query);
  }


}