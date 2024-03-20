import 'dart:developer';

import 'package:pixel_app/Employee/Api/Api/api_services.dart';
import 'package:pixel_app/Employee/Api/Api/base_service.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_delete_response_model.dart';
import 'package:pixel_app/Services/pref_manager.dart';

class EmployeeDeleteRepo extends BaseService {
  Future<EmployeeDeleteResponseModel> employeeDeleteRepo() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: employeeDeleteUrl +
          '?' +
          'employeeId=${PreferenceManager.getEmployeeId()}',
    );
    log("EmployeeDeleteResponseModel res :${response}");
    EmployeeDeleteResponseModel employeeDeleteResponseModel =
        EmployeeDeleteResponseModel.fromJson(response);
    return employeeDeleteResponseModel;
  }
}
