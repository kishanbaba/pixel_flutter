import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_change_password_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_change_password_respose_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_change_password_repo.dart';

class EmployeeChangePasswordViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeClientChangePasswordViewModel(
      EmployeeChangePasswordRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeChangePasswordResponseModel response =
          await EmployeeChangePasswordRepo()
              .employeeChangePasswordRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("EmployeeChangePasswordResponseModel RES:$response");
    } catch (e) {
      print('EmployeeChangePasswordResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
