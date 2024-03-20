import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_dashboard_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/emplyee_salary_response_model.dart';

class EmployeeDashboardRepo extends BaseService {
  Future<EmployeeDashboardResponseModel> employeeDashboardRepo() async {
    // print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: employeeDashboard);
    log("employeeDashboard res :${response}");
    EmployeeDashboardResponseModel employeeDashboardResponseModel =
        EmployeeDashboardResponseModel.fromJson(response);
    return employeeDashboardResponseModel;
  }
}
