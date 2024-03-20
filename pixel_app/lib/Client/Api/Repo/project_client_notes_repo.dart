import 'dart:developer';

import 'package:pixel_app/Client/Api/Api/api_services.dart';
import 'package:pixel_app/Client/Api/Api/base_service.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/project_client_notes_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/project_client_notes_response_model.dart';

class ProjectClientNotesRepo extends BaseService {
  Future<ProjectClientNotesResponseModel> projectClientNotesRepo(
      ProjectClientNotesRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: projectClientNoteUpate,
        body: body.toJson());
    log("register res :${response}");
    ProjectClientNotesResponseModel projectClientNotesResponseModel =
        ProjectClientNotesResponseModel.fromJson(response);
    return projectClientNotesResponseModel;
  }
}
