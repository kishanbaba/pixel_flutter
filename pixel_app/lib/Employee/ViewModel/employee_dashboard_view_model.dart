import 'dart:async';

import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_dashboard_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/emplyee_salary_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_dashboard_repo.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_salary_repo.dart';

class EmployeeDashboardViewModel extends GetxController {
  DateTime timeString = DateTime.now();
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// Dashboard...
  Future<void> employeeDashboardViewModel() async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeDashboardResponseModel response =
          await EmployeeDashboardRepo().employeeDashboardRepo();
      apiResponse = ApiResponse.complete(response);
      print("EmployeeDashboardResponseModel RES:$response");
    } catch (e) {
      print('EmployeeDashboardResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }

  void timer() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    update();
  }

  void _getTime() {
    // final DateTime now = DateTime.now();
    // final String formattedDateTime = DateFormat('MM/dd/yyyy hh:mm:ss').format(now);

    timeString = DateTime.now();
    update();
  }
}
