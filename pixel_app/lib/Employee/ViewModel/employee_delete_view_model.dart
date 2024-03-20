import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_delete_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_delete_repo.dart';

class EmployeeDeleteViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeDeleteViewModel() async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeDeleteResponseModel response =
          await EmployeeDeleteRepo().employeeDeleteRepo();
      apiResponse = ApiResponse.complete(response);
      print("EmployeeDeleteResponseModel RES:$response");
    } catch (e) {
      print('EmployeeDeleteResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
