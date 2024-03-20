import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/office_close_day_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/office_close_day_response_model.dart';

class OfficeCloseDayRepo extends BaseService {
  Future<OfficeCloseDayResponseModel> officeCloseDayRepo(
      OfficeCloseDayRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: officeHolidays, body: body.toJson());
    log("register res :${response}");
    OfficeCloseDayResponseModel officeCloseDayResponseModel =
        OfficeCloseDayResponseModel.fromJson(response);
    return officeCloseDayResponseModel;
  }
}
