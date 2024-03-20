import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/emplyee_salary_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_salary_repo.dart';

class EmployeeSalaryViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeSalaryViewModel() async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeSalaryResponseModel response =
          await EmployeeSalaryRepo().employeeSalaryRepo();
      apiResponse = ApiResponse.complete(response);
      print("EmployeeSalaryResponseModel RES:$response");
    } catch (e) {
      print('EmployeeSalaryResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
