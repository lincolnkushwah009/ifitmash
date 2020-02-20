import 'dart:async';
import 'http_call_service.dart';
import 'package:http/http.dart' as http;


class HomeService {

  HTTPService httpservice = new HTTPService();

  getProductLoadData(url, headers, body, context) async {
    return await httpservice.httpPost(url, headers, body, context);
  }

}