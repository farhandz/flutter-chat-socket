import 'package:day60/service/base/config_service.dart';
import 'package:day60/utils/auth_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

enum RequestType { GET, POST, DELETE }

class BaseServices {
  Dio _dio = new Dio();
  late Options _headersOption;

  Future _getToken() async {
    var _token = await AuthUtils.instance.getToken();
    _headersOption = ConfigServices.getHeaders(token: _token);
  }

  Future<dynamic> request(String url, RequestType type, BuildContext context,
      {dynamic data, bool? useToken}) async {
    var response;

    //If this route use token then fetch token
    if (useToken != null && useToken) {
      await _getToken();
    } else {
      _headersOption = ConfigServices.getHeaders();
    }

    try {
      switch (type) {
        case RequestType.POST:
          response = await _dio.post(url,
              data: data != null ? data : null, options: _headersOption);
          break;
        case RequestType.GET:
          response = await _dio.get(url, options: _headersOption);
          break;
        case RequestType.DELETE:
          response = await _dio.delete(url,
              data: data != null ? data : null, options: _headersOption);
          break;
      }
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.response) {
        switch (dioError.response!.statusCode) {
          case 404:
            print('400 - Not found');
            break;
          case 401:
            print('401 - Unauthorized.');
            break;
          case 500:
            print('500 - Internal Server Error.');
            break;
          case 501:
            print('501 - Not Implemented Server Error.');
            break;
          case 502:
            print('502 - Bad Gateway Server Error.');
            break;
          default:
            print(
                '${dioError.response!.statusCode} - Something went wrong while trying to connect with the server');
            break;
        }
      } else if (dioError.type == DioErrorType.other) {
        print("check internet connection");
      }
    }

    // var responseString = response.toString();
    // //* Handling error and status code
    response = json.decode(response.toString());

    // print(response);

    //* if 401 then return to login
    // if (response["code"] == 401) {
    //   print("401 error login ulang");
    //   return null;
    // }

    return response;
  }
}
