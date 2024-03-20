import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/dashboard_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/dashboard_response_model.dart';

import '../Model/RequestModel/login_request_model.dart';

class DashboardRepo extends BaseService {
  Future<DashboardResponseModel> dashboardRepo(
      DashboardRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: dashboardUrl, body: body.toJson());
    log("register res :${response}");
    DashboardResponseModel dashboardResponseModel =
        DashboardResponseModel.fromJson(response);
    return dashboardResponseModel;
  }
}
