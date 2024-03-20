import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/office_close_day_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/office_close_day_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/office_close_day_repo.dart';

class OfficeCloseDayViewModel extends GetxController {
  OfficeCloseDayResponseModel? pageResponse;

  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> officeCloseDayViewModel(
      OfficeCloseDayRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      OfficeCloseDayResponseModel response =
          await OfficeCloseDayRepo().officeCloseDayRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("OfficeCloseDayResponseModel RES:$response");
    } catch (e) {
      print('OfficeCloseDayResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
