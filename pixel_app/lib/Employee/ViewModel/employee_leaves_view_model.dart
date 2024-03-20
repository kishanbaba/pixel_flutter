import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leaves_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leaves_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_Leaves_repo.dart';

class EmployeeLeavesViewModel extends GetxController {
  ApiResponse employeeLeavesApiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeLeavesViewModel(
      EmployeeLeavesRequestModel requestModel) async {
    employeeLeavesApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeLeavesResponseModel response =
          await EmployeeLeavesRepo().employeeLeavesRepo(requestModel);
      employeeLeavesApiResponse = ApiResponse.complete(response);
      print("employeeLeavesViewModel RES:$response");
      update();
    } catch (e) {
      print('employeeLeavesViewModel.....$e');
      employeeLeavesApiResponse = ApiResponse.error('error');
      update();
    }
    update();
  }
}
