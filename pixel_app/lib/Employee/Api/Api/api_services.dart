import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_app/Employee/Api/Api/api_extention.dart';

import 'package:pixel_app/Services/pref_manager.dart';

import 'base_service.dart';

enum APIType { aPost, aGet }

class ApiService extends BaseService {
  var response;

  Future<dynamic> getResponse(
      {@required APIType? apiType,
      @required String? url,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      bool fileUpload = false}) async {
    print(
        '--PreferenceManager.getEmployeeId()--${PreferenceManager.getEmployeeId()}');
    header = {
      'app_code': "Pixel_foFcz7zdbpixel095FEhK148tFYa",
      "Content-Type": "application/json",
      'EmployeeID': '${PreferenceManager.getEmployeeId()}',
    };
    try {
      String? mainUrl = baseURL + url!;
      log("URL ---> ${baseURL + url}");
      if (apiType == APIType.aGet) {
        var result = await http.get(Uri.parse(baseURL + url));
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("response......${response}");
      } else if (fileUpload) {
        dio.FormData formData = new dio.FormData.fromMap(body!);

        dio.Response result = await dio.Dio().post(baseURL + url,
            data: formData, options: dio.Options(contentType: "form-data"));
        print('responseType+>${result.data.runtimeType}');
        response = returnResponse(result.statusCode!, result.data);
      } else if (apiType == APIType.aPost) {
        var encodeBody = json.encode(body); // jsonEncode(body);
        log("REQUEST ENCODE BODY $encodeBody");
        log("REQUEST  BODY $body");

        var result = await http.post(Uri.parse(baseURL + url),
            headers: header, body: encodeBody);
        log('resultresult : ${result.body}');
        print('resultresult : ${result.body}');
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("response......${response}");
      } else {
        // var encodeBody = jsonEncode(body);
        // log("REQUEST ENCODE BODY $body");
        // var result = await http.post(
        //   Uri.parse(mainUrl),
        //   // headers: header,
        //   body: encodeBody,
        // );
        // response = returnResponse(result.statusCode, result.body);
      }
      return response;
    } catch (e) {
      log('Error=>.. $e');
    }
  }

  returnResponse(int status, String result) {
    print("status$status");
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 256:
        return jsonDecode(result);

      case 400:
        throw BadRequestException('Bad Request');
      case 401:
        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}
