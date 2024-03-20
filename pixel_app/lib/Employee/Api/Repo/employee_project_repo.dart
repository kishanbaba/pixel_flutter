import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_project_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_finished_project_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_pending_project_response_model.dart';

class EmployeeProjectRepo extends BaseService {
  Future<EmployeePendingProjectResponseModel> employeePendingProjectRepo(
      EmployeeProjectRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeEvents, body: body.toJson());
    log("register res :${response}");
    EmployeePendingProjectResponseModel employeePendingProjectResponseModel =
        EmployeePendingProjectResponseModel.fromJson(response);
    return employeePendingProjectResponseModel;
  }

  Future<EmployeeFinishedProjectResponseModel> employeeFinishedProjectRepo(
      EmployeeProjectRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeEvents, body: body.toJson());
    log("employeeFinishedProjectResponseModel register res :${response}");
    EmployeeFinishedProjectResponseModel employeeFinishedProjectResponseModel =
        EmployeeFinishedProjectResponseModel.fromJson(response);
    return employeeFinishedProjectResponseModel;
  }
}
