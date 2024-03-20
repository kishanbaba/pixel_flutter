import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/same_day_add_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/same_day_add_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/same_day_add_repo.dart';

class SameDayAddViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// same day...
  Future<void> sameDayAddViewModel(SameDayAddRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      SameDayAddResponseModel response =
          await SameDayAddRepo().sameDayAddRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("SameDayAddResponseModel RES:$response");
    } catch (e) {
      print('SameDayAddResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
