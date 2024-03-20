import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/same_day_response_model.dart';

class SameDayRepo extends BaseService {
  Future<SameDayResponseModel> sameDayRepo() async {
    // print('Register Req :$body');
    // Map<String, dynamic> encodeBody = {"day_edit_dt": "2022-06-01T00:00:00"};
    var response =
        await ApiService().getResponse(apiType: APIType.aPost, url: sameDay);
    log("register res :${response}");
    SameDayResponseModel sameDayResponseModel =
        SameDayResponseModel.fromJson(response);
    return sameDayResponseModel;
  }
}
