import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_delete_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_delete_response_model.dart';

class EmployeeLeaveDeleteRepo extends BaseService {
  Future<EmployeeLeaveDeleteResponseModel> employeeLeaveDeleteRepo(
      EmployeeLeaveDeleteRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeLeavesDelete, body: body.toJson());
    log("register res :${response}");
    EmployeeLeaveDeleteResponseModel employeeLeaveDeleteResponseModel =
        EmployeeLeaveDeleteResponseModel.fromJson(response);
    return employeeLeaveDeleteResponseModel;
  }
}
