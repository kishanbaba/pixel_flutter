import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_attendance_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_attendance_response_model.dart';
import 'package:pixel_app/Employee/Api/Repo/employee_attendance_repo.dart';

class EmployeeAttendanceViewModel extends GetxController {
  DateTime? userSelectedDate = DateTime.now();

  dateIncrement() {
    print('------------- +++ date $userSelectedDate');
    DateTime today = DateTime.now();
    if (userSelectedDate!
        .isBefore(DateTime(today.year, today.month, today.day))) {
      userSelectedDate = DateTime(userSelectedDate!.year,
          userSelectedDate!.month + 1, userSelectedDate!.day);
    }
    print('------------- +++ later ++++++++++++ date $userSelectedDate');
    update();
  }

  dateDecrement() {
    userSelectedDate = DateTime(userSelectedDate!.year,
        userSelectedDate!.month - 1, userSelectedDate!.day);
    print('------------- --- date $userSelectedDate');
    update();
  }

  ApiResponse apiResponse = ApiResponse.initial('Initial');

  /// register...
  Future<void> employeeAttendanceViewModel(
      EmployeeAttendanceRequestModel body) async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      EmployeeAttendanceResponseModel response =
          await EmployeeAttendanceRepo().employeeAttendanceRepo(body);
      apiResponse = ApiResponse.complete(response);
      print("EmployeeAttendanceResponseModel RES:$response");
    } catch (e) {
      print('EmployeeAttendanceResponseModel.....$e');
      apiResponse = ApiResponse.error('error');
    }
    update();
  }
}
