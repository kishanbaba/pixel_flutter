import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_get_country_currency_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/client_get_country_currency_repo.dart';

class ClientGetCountryCurrencyViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// ClientGetCountryCurrencyViewModel
  Future<void> clientGetCountryCurrencyViewModel() async {
    apiResponse = ApiResponse.loading('Loading');
    update();
    try {
      ClientGetCountryCurrencyResponseModel response =
          await ClientGetCountryCurrencyRepo().clientGetCountryCurrencyRepo();
      apiResponse = ApiResponse.complete(response);
      print(
          "ClientGetCountryCurrencyResponseModel Get ----------  RES:$response");
    } catch (e) {
      print('ClientGetCountryCurrencyResponseModel Get -------------- .....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
