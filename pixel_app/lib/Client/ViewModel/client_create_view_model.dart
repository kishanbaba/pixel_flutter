import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_create_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_create_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/client_create_repo.dart';

class ClientCreateViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> clientCreateViewModel(
      ClientCreateRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      ClientCreateResponseModel response =
          await ClientCreateRepo().clientCreateRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("ClientClientCreateViewModel RES:$response");
    } catch (e) {
      print('ClientClientCreateViewModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
