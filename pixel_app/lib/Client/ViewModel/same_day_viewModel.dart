import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/same_day_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/same_day_repo.dart';

class SameDayViewModel extends GetxController {
  SameDayResponseModel? sameDayResponse;

  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// same day...
  Future<void> sameDayViewModel() async {
    apiResponse = ApiResponse.loading('Loading');
    update();
    try {
      SameDayResponseModel response = await SameDayRepo().sameDayRepo();
      apiResponse = ApiResponse.complete(response);
      print("SameDayResponseModel Get ----------  RES:$response");
    } catch (e) {
      print('SameDayResponseModel Get -------------- .....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
