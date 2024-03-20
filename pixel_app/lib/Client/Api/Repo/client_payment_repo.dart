import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_payment_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_payment_response_model.dart';

class ClientPaymentRepo extends BaseService {
  Future<ClientPaymentResponseModel> clientPaymentRepo(
      ClientPaymentRequestModel body) async {
    print('ClientPayment Req :$body');
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: clientPayment,
      body: body.toJson(),
      // header: {
      //   'ClientId': "4",
      //   'app_code': 'Pixel_foFcz7zdbpixel095FEhK148tFYa',
      //   'Content-Type': "application/json"
      // }
      //
    );
    log("ClientPayment res :${response}");
    ClientPaymentResponseModel clientPaymentResponseModel =
        ClientPaymentResponseModel.fromJson(response);
    return clientPaymentResponseModel;
  }
}
