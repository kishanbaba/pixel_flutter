import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_attendance_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_attendance_response_model.dart';

class EmployeeAttendanceRepo extends BaseService {
  Future<EmployeeAttendanceResponseModel> employeeAttendanceRepo(
      EmployeeAttendanceRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeAttendance, body: body.toJson());
    log("register res :${response}");
    EmployeeAttendanceResponseModel employeeAttendanceResponseModel =
        EmployeeAttendanceResponseModel.fromJson(response);
    return employeeAttendanceResponseModel;
  }
}
