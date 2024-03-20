import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_update_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_update_response_model.dart';

class ClientUpdateRepo extends BaseService {
  Future<ClientUpdateResponseModel> clientUpdateRepo(
      ClientUpdateRequestModel body) async {
    print('ClientUpdate Req :$body');
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: clientCreateAndUpdate,
      body: body.toJson(),
    );
    log("ClientUpdate res :${response}");
    ClientUpdateResponseModel clientUpdateResponseModel =
        ClientUpdateResponseModel.fromJson(response);
    return clientUpdateResponseModel;
  }
}
