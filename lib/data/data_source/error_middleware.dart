import 'dart:convert';

import 'package:pretty_http_logger/pretty_http_logger.dart';

class ErrorAdapterMiddleware extends MiddlewareContract {
  @override
  void interceptError(error) {
    if (error is Exception) {
      throw Exception('Please check your internet connection');
    }
    throw Exception('Something went wrong');
  }

  @override
  void interceptRequest(RequestData data) {}

  @override
  void interceptResponse(ResponseData data) {
    if (data.statusCode == 405) {
      final response = jsonDecode(data.body);
      if(response != null && response['error'] != null) {
        throw Exception(response['error']);
      }
      throw Exception('Not Allowed, try again later');
    }
    if (data.statusCode == 400) {
      throw Exception('Bad Request');
    }
    if (data.statusCode == 500) {
      throw Exception('Internal Server Error');
    }
    if (data.statusCode == 404) {
      throw Exception('Item not found');
    }
  }
}
