import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_change_password_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_start_end_project_event_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_change_password_respose_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_start_end_project_event_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_change_password_repo.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_start_end_project_event_repo.dart';

class EmployeeStartEndProjectEventViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeStartEndProjectEventViewModel(
      EmployeeStartEndProjectEventRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeStartEndProjectEventResponseModel response =
          await EmployeeStartEndProjectEventRepo()
              .employeeStartEndProjectEventRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("EmployeeStartEndProjectEventResponseModel RES:$response");
    } catch (e) {
      print('EmployeeStartEndProjectEventResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
