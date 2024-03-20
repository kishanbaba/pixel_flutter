import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_add_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_add_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_leave_add_repo.dart';

class EmployeeLeaveAddViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeLeaveAddViewModel(
      EmployeeLeaveAddRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeLeaveAddResponseModel response =
          await EmployeeLeaveAddRepo().employeeLeaveAddRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("EmployeeLeaveAddResponseModel RES:$response");
    } catch (e) {
      print('EmployeeLeaveAddResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
