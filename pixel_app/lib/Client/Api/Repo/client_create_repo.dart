import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_create_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_create_response_model.dart';

class ClientCreateRepo extends BaseService {
  Future<ClientCreateResponseModel> clientCreateRepo(
      ClientCreateRequestModel body) async {
    print('ClientCreate Req :$body');
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: clientCreateAndUpdate,
      body: body.toJson(),
    );
    log("ClientCreate res :${response}");
    ClientCreateResponseModel clientCreateResponseModel =
        ClientCreateResponseModel.fromJson(response);
    return clientCreateResponseModel;
  }
}
