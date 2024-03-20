import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_login_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_login_response_model.dart';

class EmployeeLoginRepo extends BaseService {
  Future<EmployeeLoginResponseModel> employeeLoginRepo(
      EmployeeLoginRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: employeeLoginUrl, body: body.toJson());
    log("register res :${response}");
    EmployeeLoginResponseModel employeeLoginResponseModel =
        EmployeeLoginResponseModel.fromJson(response);
    return employeeLoginResponseModel;
  }
}
