import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_payment_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_payment_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/client_payment_repo.dart';

class ClientPaymentViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> clientPaymentViewModel(
      ClientPaymentRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      ClientPaymentResponseModel response =
          await ClientPaymentRepo().clientPaymentRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("clientPaymentViewModel RES:$response");
    } catch (e) {
      print('clientPaymentViewModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
