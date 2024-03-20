import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_project_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_finished_project_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_pending_project_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_project_repo.dart';

class EmployeeProjectViewModel extends GetxController {
  ApiResponse employeePendingProjectApiResponse =
      ApiResponse.initial('Initial');
  ApiResponse employeeFinishedProjectApiResponse =
      ApiResponse.initial('Initial');

  /// register...employeePendingProjectViewModel.....
  Future<void> employeePendingProjectViewModel(
      EmployeeProjectRequestModel requestModel) async {
    employeePendingProjectApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeePendingProjectResponseModel response =
          await EmployeeProjectRepo().employeePendingProjectRepo(requestModel);
      employeePendingProjectApiResponse = ApiResponse.complete(response);
      print("employeePendingProjectViewModel RES:$response");
      update();
    } catch (e) {
      print('employeePendingProjectViewModel.....$e');
      employeePendingProjectApiResponse = ApiResponse.error('error');
      update();
    }
    update();
  }

  /// register...employeeFinishedProjectViewModel.....
  Future<void> employeeFinishedProjectViewModel(
      EmployeeProjectRequestModel requestModel) async {
    employeeFinishedProjectApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeFinishedProjectResponseModel response =
          await EmployeeProjectRepo().employeeFinishedProjectRepo(requestModel);
      employeeFinishedProjectApiResponse = ApiResponse.complete(response);
      print("employeeFinishedProjectViewModel RES:$response");
      update();
    } catch (e) {
      print('employeeFinishedProjectViewModel.....$e');
      employeeFinishedProjectApiResponse = ApiResponse.error('error');
      update();
    }
    update();
  }
}
