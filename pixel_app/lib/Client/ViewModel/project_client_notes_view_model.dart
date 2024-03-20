import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/project_client_notes_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/project_client_notes_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/project_client_notes_repo.dart';

class ProjectClientNotesViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...LoginResponseModel.....
  Future<void> projectClientNotesViewModel(
      ProjectClientNotesRequestModel requestModel) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      ProjectClientNotesResponseModel response =
          await ProjectClientNotesRepo().projectClientNotesRepo(requestModel);
      apiResponse = ApiResponse.complete(response);
      print("ProjectClientNotesResponseModel RES:$response");
      update();
    } catch (e) {
      print('ProjectClientNotesResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
      update();
    }
    update();
  }
}
