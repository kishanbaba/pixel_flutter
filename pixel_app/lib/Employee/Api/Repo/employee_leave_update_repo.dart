import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_update_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_update_response_model.dart';

class EmployeeLeaveUpdateRepo extends BaseService {
  Future<EmployeeLeaveUpdateResponseModel> employeeLeaveUpdateRepo(
      EmployeeLeaveUpdateRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeLeavesUpdate, body: body.toJson());
    log("register res :${response}");
    EmployeeLeaveUpdateResponseModel employeeLeaveUpdateResponseModel =
        EmployeeLeaveUpdateResponseModel.fromJson(response);
    return employeeLeaveUpdateResponseModel;
  }
}
