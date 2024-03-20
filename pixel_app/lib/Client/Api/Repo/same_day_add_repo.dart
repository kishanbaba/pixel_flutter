import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/same_day_add_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/same_day_add_response_model.dart';

class SameDayAddRepo extends BaseService {
  Future<SameDayAddResponseModel> sameDayAddRepo(
      SameDayAddRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: sameDayAdd, body: body.toJson());
    log("register res :${response}");
    SameDayAddResponseModel sameDayAddResponseModel =
        SameDayAddResponseModel.fromJson(response);
    return sameDayAddResponseModel;
  }
}
