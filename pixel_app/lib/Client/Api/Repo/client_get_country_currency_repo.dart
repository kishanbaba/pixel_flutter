import 'dart:developer';
import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_get_country_currency_response_model.dart';

class ClientGetCountryCurrencyRepo extends BaseService {
  Future<ClientGetCountryCurrencyResponseModel>
      clientGetCountryCurrencyRepo() async {
    // print('Register Req :$body');
    // Map<String, dynamic> encodeBody = {"day_edit_dt": "2022-06-01T00:00:00"};
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: clientGetCountryCurrency);
    log("register res :${response}");
    ClientGetCountryCurrencyResponseModel
        clientGetCountryCurrencyResponseModel =
        ClientGetCountryCurrencyResponseModel.fromJson(response);
    return clientGetCountryCurrencyResponseModel;
  }
}
