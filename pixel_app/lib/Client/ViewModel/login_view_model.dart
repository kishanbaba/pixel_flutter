import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/login_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/login_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/login_repo.dart';

class LoginViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> loginViewModel(LoginRequestModel requestModel, String fcmToken) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      LoginResponseModel response = await LoginRepo().loginRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      await LoginRepo().deviceInsert(userID: response.data?.first.clientId.toString() ?? "", token: fcmToken);
      print("LoginResponseModel RES:$response");
    } catch (e) {
      print('LoginResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
