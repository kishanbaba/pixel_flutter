import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_detail_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_detail_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/client_detail_repo.dart';

class ClientDetailViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> clientDetailViewModel(
      ClientDetailRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      ClientDetailResponseModel response =
          await ClientDetailRepo().clientDetailRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("ClientClientDetailViewModel RES:$response");
    } catch (e) {
      print('ClientClientDetailViewModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
