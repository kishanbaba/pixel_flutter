import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_delete_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_delete_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_leave_delete_repo.dart';

class EmployeeLeaveDeleteViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeLeaveDeleteViewModel(
      EmployeeLeaveDeleteRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeLeaveDeleteResponseModel response =
          await EmployeeLeaveDeleteRepo().employeeLeaveDeleteRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("EmployeeLeaveDeleteResponseModel RES:$response");
    } catch (e) {
      print('EmployeeLeaveDeleteResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
