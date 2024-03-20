import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_checkin_checkout_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_login_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_checkin_checkout_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_login_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_checkin_checkout_repo.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_login_repo.dart';

class EmployeeCheckInCheckOutViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// CHECK IN CHECK OUT...
  Future<void> employeeCheckInCheckOutViewModel(
      EmployeeCheckInCheckOutRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeCheckInCheckOutResponseModel response =
          await EmployeeCheckInCheckOutRepo()
              .employeeCheckInCheckOutRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("EmployeeCheckInCheckOutResponseModel RES:$response");
    } catch (e) {
      print('EmployeeCheckInCheckOutResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
