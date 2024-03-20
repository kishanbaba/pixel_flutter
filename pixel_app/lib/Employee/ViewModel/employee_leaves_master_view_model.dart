import 'dart:async';

import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leaves_master_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_leaves_master_repo.dart';

class EmployeeLeavesMasterViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// LeavesMaster...
  Future<void> employeeLeavesMasterViewModel() async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeLeavesMasterResponseModel response =
          await EmployeeLeavesMasterRepo().employeeLeavesMasterRepo();
      apiResponse = ApiResponse.complete(response);
      print("EmployeeLeavesMasterResponseModel RES:$response");
    } catch (e) {
      print('EmployeeLeavesMasterResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
