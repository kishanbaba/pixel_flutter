import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_delete_response_model.dart';
import 'package:pixel_app/Services/pref_manager.dart';

class ClientDeleteRepo extends BaseService {
  Future<ClientDeleteResponseModel> clientDeleteRepo() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: clientDelete + '?' + 'clientId=${PreferenceManager.getClientId()}',
    );
    log("ClientDetail res :${response}");
    ClientDeleteResponseModel clientDeleteResponseModel =
        ClientDeleteResponseModel.fromJson(response);
    return clientDeleteResponseModel;
  }
}
