import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_update_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_update_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/client_update_repo.dart';

class ClientUpdateViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> clientUpdateViewModel(
      ClientUpdateRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      ClientUpdateResponseModel response =
          await ClientUpdateRepo().clientUpdateRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("ClientClientUpdateViewModel RES:$response");
    } catch (e) {
      print('ClientClientUpdateViewModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
