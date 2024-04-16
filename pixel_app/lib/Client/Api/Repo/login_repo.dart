import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/login_response_model.dart';

import '../Model/RequestModel/login_request_model.dart';

class LoginRepo extends BaseService {
  Future<LoginResponseModel> loginRepo(LoginRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: loginUrl, body: body.toJson());
    log("register res :${response}");
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(response);
    return loginResponseModel;
  }

  Future<void> deviceInsert({required String userID, required String token,}) async {
    // print('Register Req :$body');
    var body = {
      "Id": userID,
      "DeviceId": token,
      "IsClient": true,
    };
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: deviceInsertAPI, body: body);
    log("deviceInsert :${response}");
  }
}
