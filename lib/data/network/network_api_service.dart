import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider_mvvm/data/expection/app_expection.dart';
import 'package:provider_mvvm/data/expection/response_expection.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  AppException appException = AppException();

  @override
  Future getApiService(url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (kDebugMode) {
        print("response ${response.body}");
      }
      if (kDebugMode) {
        print("response.statusCode ${response.statusCode}");
      }
      return returnResponse(response);
    } catch (e, stackTrace) {
      throw appException.handelException(e, stackTrace);
    }
  }

  @override
  Future postApiService(url, Map<dynamic, dynamic> data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (kDebugMode) {
        print("response ${response.body}");
      }
      if (kDebugMode) {
        print("response.statusCode ${response.statusCode}");
      }
      return returnResponse(response);
    } catch (e ) {
      throw appException.handelException(e);
    }
  }
}

dynamic returnResponse(http.Response response) {
  if (kDebugMode) {

  }

  switch (response.statusCode) {
    case 200:

      return json.decode(response.body);

    case 404:
      throw UserNotFound();
    case 400:
      throw UserNotFound();
    case 401:
      throw CommunicationException("UnAuthorized");
    default:
      throw FetchDataException();
  }
}
