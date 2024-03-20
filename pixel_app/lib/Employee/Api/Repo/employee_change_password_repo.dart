import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_change_password_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_change_password_respose_model.dart';

class EmployeeChangePasswordRepo extends BaseService {
  Future<EmployeeChangePasswordResponseModel> employeeChangePasswordRepo(
      EmployeeChangePasswordRequestModel body) async {
    print('changePasswordRepo Req :$body');
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: employeeChangePassword,
      body: body.toJson(),
    );
    log("changePasswordRepo res :${response}");
    EmployeeChangePasswordResponseModel employeeChangePasswordResponseModel =
        EmployeeChangePasswordResponseModel.fromJson(response);
    return employeeChangePasswordResponseModel;
  }
}
