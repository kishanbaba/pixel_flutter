import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_start_end_project_event_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_start_end_project_event_response_model.dart';

class EmployeeStartEndProjectEventRepo extends BaseService {
  Future<EmployeeStartEndProjectEventResponseModel>
      employeeStartEndProjectEventRepo(
          EmployeeStartEndProjectEventRequestModel body) async {
    // print('Register Req :$body');
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: employeeStartEndProjectEvent,
        body: body.toJson());
    log("register res :${response}");
    EmployeeStartEndProjectEventResponseModel
        employeeStartEndProjectEventResponseModel =
        EmployeeStartEndProjectEventResponseModel.fromJson(response);
    return employeeStartEndProjectEventResponseModel;
  }
}
