import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_change_password_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_change_password_respose_model.dart';

class ClientChangePasswordRepo extends BaseService {
  Future<ChangePasswordResponseModel> clientChangePasswordRepo(
      ChangePasswordRequestModel body) async {
    print('changePasswordRepo Req :$body');
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: clientChangePassword,
      body: body.toJson(),
    );
    log("changePasswordRepo res :${response}");
    ChangePasswordResponseModel changePasswordResponseModel =
        ChangePasswordResponseModel.fromJson(response);
    return changePasswordResponseModel;
  }
}
