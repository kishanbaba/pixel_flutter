import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_attendance_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_checkin_checkout_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_attendance_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_checkin_checkout_response_model.dart';

class EmployeeCheckInCheckOutRepo extends BaseService {
  Future<EmployeeCheckInCheckOutResponseModel> employeeCheckInCheckOutRepo(
      EmployeeCheckInCheckOutRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: employeeCheckInCheckOut,
        body: body.toJson());
    log("EmployeeCheckInCheckOutRequestModel res :${response}");
    EmployeeCheckInCheckOutResponseModel employeeCheckInCheckOutResponseModel =
        EmployeeCheckInCheckOutResponseModel.fromJson(response);
    return employeeCheckInCheckOutResponseModel;
  }
}
