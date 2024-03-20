import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/project_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/finished_project_response_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/project_response_model.dart';

class ProjectRepo extends BaseService {
  Future<PendingProjectResponseModel> pendingProjectRepo(
      ProjectRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: projectUrl, body: body.toJson());
    log("register res :${response}");
    PendingProjectResponseModel pendingProjectResponseModel =
        PendingProjectResponseModel.fromJson(response);
    return pendingProjectResponseModel;
  }

  Future<FinishedProjectResponseModel> finishedProjectRepo(
      ProjectRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: projectUrl, body: body.toJson());
    log("finishedProjectRepo register res :${response}");
    FinishedProjectResponseModel finishedProjectResponseModel =
        FinishedProjectResponseModel.fromJson(response);
    return finishedProjectResponseModel;
  }
}
