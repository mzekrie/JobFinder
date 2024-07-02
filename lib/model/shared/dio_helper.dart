// URL  = https://project2.amit-learning.com/api
// URL allJobs = https://project2.amit-learning.com/api/jobs

import 'package:dio/dio.dart';


import 'constant_attribute.dart';


class DioHelper{
  static Dio dio = Dio(); // object
  static inti(){
    dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            "content-type" : "application/json",
            "Accept":"application/json",
          },
        )
    );
  } // inti

// get method
  static getData({String? token,required String url,Map<String, dynamic>? data,Map<String, dynamic>? query,}) async {
    try {
      // if API request a key token
      dio.options.headers = {"Authorization": "Bearer ${token ?? ''} "};
      // if the network is blocked due to anti virus
      // dio.httpClientAdapter = IOHttpClientAdapter(
      //   createHttpClient: (client) {
      //     client.badCertificateCallback =
      //         (X509Certificate cert, String host, int port) => true;
      //     return client;
      //   },
      // );
      var response = await dio.get(url, data: data, queryParameters: query);
      print("${response.data} status ${response.statusCode} get data success");
      return response;
    } catch (error) {
      print(error);
      return error;
    }
  }

// post method
  static postData({String? token,required String url,required Map<String, dynamic> data,Map<String, dynamic>? query,}) async {
    try {
      dio.options.headers = {"Authorization": "Bearer ${token ?? ''} "};
      // dio.httpClientAdapter = IOHttpClientAdapter(
      //   createHttpClient: (client) {
      //     client.badCertificateCallback =
      //         (X509Certificate cert, String host, int port) => true;
      //     return client;
      //   },
      // );
      var response = await dio.post(url, data: data, queryParameters: query);
      print(" status ${response.statusCode} post data success");
      return response;
    } catch (error) {
      print(error);
      return (error);
    }
  }


// put method
  static putData({String? token,required String url, Map<String, dynamic>? data,Map<String, dynamic>? query,}) async {
    try {
      dio.options.headers = {"Authorization": "Bearer ${token ?? ''} "};
      // dio.httpClientAdapter = IOHttpClientAdapter(
      //   createHttpClient: (client) {
      //     client.badCertificateCallback =
      //         (X509Certificate cert, String host, int port) => true;
      //     return client;
      //   },
      // );
      var response = await dio.put(url, data: data, queryParameters: query);
      print("status ${response.statusCode} put update data success");
      return response;
    } catch (error) {
      print(error);
      return (error);
    }
  }

// delete method
  static deleteData({String? token,required String url,required Map<String, dynamic> data,Map<String, dynamic>? query,}) async {
    try {
      dio.options.headers = {"Authorization": "Bearer ${token ?? ''} "};
      // dio.httpClientAdapter = IOHttpClientAdapter(
      //   createHttpClient: (client) {
      //     client.badCertificateCallback =
      //         (X509Certificate cert, String host, int port) => true;
      //     return client;
      //   },
      // );
      var response = await dio.delete(url, data: data, queryParameters: query);
      print("status ${response.statusCode} delete data success");
      return response;
    } catch (error) {
      print(error);
      return (error);
    }
  }





}//// end of class DioHelper