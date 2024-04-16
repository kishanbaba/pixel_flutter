import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_login_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_login_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_login_repo.dart';

class EmployeeLoginViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeLoginViewModel(
      EmployeeLoginRequestModel requestModel, String fcmToken) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeLoginResponseModel response =
          await EmployeeLoginRepo().employeeLoginRepo(requestModel);
      apiResponse = ApiResponse.complete(response);

      await EmployeeLoginRepo().deviceInsert(userID: response.data?.first.employeeId.toString() ?? "", token: fcmToken);
      print("EmployeeLoginResponseModel RES:$response");
    } catch (e) {
      print('EmployeeLoginResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
