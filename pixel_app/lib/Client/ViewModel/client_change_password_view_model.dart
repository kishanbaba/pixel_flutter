import 'package:get/get.dart';

import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_change_password_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_change_password_respose_model.dart';
import 'package:pixel_app/Client/Api/Repo/client_change_password_repo.dart';

class ClientChangePasswordViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> clientChangePasswordViewModel(
      ChangePasswordRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      ChangePasswordResponseModel response = await ClientChangePasswordRepo()
          .clientChangePasswordRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("ClientChangePasswordViewModel RES:$response");
    } catch (e) {
      print('ClientChangePasswordViewModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
