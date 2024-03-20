import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_update_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_update_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_leave_update_repo.dart';

class EmployeeLeaveUpdateViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeLeaveUpdateViewModel(
      EmployeeLeaveUpdateRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeLeaveUpdateResponseModel response =
          await EmployeeLeaveUpdateRepo().employeeLeaveUpdateRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("EmployeeLeaveUpdateResponseModel RES:$response");
    } catch (e) {
      print('EmployeeLeaveUpdateResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
