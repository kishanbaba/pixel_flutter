import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_delete_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/client_delete_repo.dart';

class ClientDeleteViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> clientDeleteViewModel() async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      ClientDeleteResponseModel response =
          await ClientDeleteRepo().clientDeleteRepo();
      apiResponse = ApiResponse.complete(response);
      print("ClientDeleteResponseModel RES:$response");
    } catch (e) {
      print('ClientDeleteResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
