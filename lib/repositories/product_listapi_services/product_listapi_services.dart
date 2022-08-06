import 'dart:developer';

import 'package:dio/dio.dart';

class ProductListApiServices {
  Future<Response> getProductDetails() async {
    Dio dio = Dio();
    Response response = await dio.get(
      'https://jsonkeeper.com/b/YIDG',
    );
    log('response ${response}');
    return response;
  }
}
