import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/emplyee_salary_response_model.dart';

class EmployeeSalaryRepo extends BaseService {
  Future<EmployeeSalaryResponseModel> employeeSalaryRepo() async {
    // print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: employeeAttendanceSalary);
    log("register res :${response}");
    EmployeeSalaryResponseModel employeeSalaryResponseModel =
        EmployeeSalaryResponseModel.fromJson(response);
    return employeeSalaryResponseModel;
  }
}
