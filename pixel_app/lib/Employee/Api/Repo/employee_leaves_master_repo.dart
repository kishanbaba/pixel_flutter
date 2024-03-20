import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leaves_master_response_model.dart';

class EmployeeLeavesMasterRepo extends BaseService {
  Future<EmployeeLeavesMasterResponseModel> employeeLeavesMasterRepo() async {
    // print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: employeeLeavesMaster);
    log("employeeLeavesMaster res :${response}");
    EmployeeLeavesMasterResponseModel employeeLeavesMasterResponseModel =
        EmployeeLeavesMasterResponseModel.fromJson(response);
    return employeeLeavesMasterResponseModel;
  }
}
