import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leaves_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leaves_response_model.dart';

class EmployeeLeavesRepo extends BaseService {
  Future<EmployeeLeavesResponseModel> employeeLeavesRepo(
      EmployeeLeavesRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeLeaves, body: body.toJson());
    log("register res :${response}");
    EmployeeLeavesResponseModel employeeLeavesResponseModel =
        EmployeeLeavesResponseModel.fromJson(response);
    return employeeLeavesResponseModel;
  }
}
