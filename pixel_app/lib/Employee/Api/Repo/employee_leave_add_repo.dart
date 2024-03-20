import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_add_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_add_response_model.dart';

class EmployeeLeaveAddRepo extends BaseService {
  Future<EmployeeLeaveAddResponseModel> employeeLeaveAddRepo(
      EmployeeLeaveAddRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeLeavesAdd, body: body.toJson());
    log("register res :${response}");
    EmployeeLeaveAddResponseModel employeeLeaveAddResponseModel =
        EmployeeLeaveAddResponseModel.fromJson(response);
    return employeeLeaveAddResponseModel;
  }
}
