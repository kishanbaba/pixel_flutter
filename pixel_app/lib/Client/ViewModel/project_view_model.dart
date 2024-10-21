import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/project_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/finished_project_response_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/project_response_model.dart';
import 'package:pixel_app/Client/Api/Repo/project_repo.dart';

class ProjectViewModel extends GetxController {
  ApiResponse pendingProjectApiResponse = ApiResponse.initial('Initial');
  ApiResponse finishedProjectApiResponse = ApiResponse.initial('Initial');

  /// register...LoginResponseModel.....
  Future<void> pendingProjectViewModel(ProjectRequestModel requestModel) async {
    pendingProjectApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      PendingProjectResponseModel response =
          await ProjectRepo().pendingProjectRepo(requestModel);
      pendingProjectApiResponse = ApiResponse.complete(response);
      print("ProjectViewModel RES:$response");
      update();
    } catch (e) {
      print('ProjectViewModel.....$e');
      pendingProjectApiResponse = ApiResponse.error('error');
      update();
    }
    update();
  }

  /// register...LoginResponseModel.....
  Future<void> finishedProjectViewModel(
      ProjectRequestModel requestModel) async {
    finishedProjectApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      FinishedProjectResponseModel response =
          await ProjectRepo().finishedProjectRepo(requestModel);
      finishedProjectApiResponse = ApiResponse.complete(response);
      print("finishedProjectViewModel RES:$response");
      update();
    } catch (e) {
      print('ProjectViewModel.....$e');
      finishedProjectApiResponse = ApiResponse.error('error');
      update();
    }
    update();
  }
}