import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/dashboard_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/dashboard_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/dashboard_repo.dart';

class DashboardViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> dashboardViewModel(DashboardRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      DashboardResponseModel response =
          await DashboardRepo().dashboardRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("DashboardResponseModel RES:$response");
    } catch (e) {
      print('LoginResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
