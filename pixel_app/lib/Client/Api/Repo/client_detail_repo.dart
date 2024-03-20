import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_detail_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_detail_response_model.dart';

class ClientDetailRepo extends BaseService {
  Future<ClientDetailResponseModel> clientDetailRepo(
      ClientDetailRequestModel body) async {
    print('ClientDetail Req :$body');
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: clientDetail,
      body: body.toJson(),
    );
    log("ClientDetail res :${response}");
    ClientDetailResponseModel clientDetailResponseModel =
        ClientDetailResponseModel.fromJson(response);
    return clientDetailResponseModel;
  }
}
