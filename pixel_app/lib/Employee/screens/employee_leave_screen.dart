import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_delete_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leaves_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_delete_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leaves_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/emplyee_salary_response_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_leave_delete_veiwModel.dart';
import 'package:pixel_app/Employee/ViewModel/employee_leaves_view_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_salary_view_model.dart';
import 'package:pixel_app/Employee/screens/employee_leave_add_screen.dart';
import 'package:pixel_app/Employee/screens/employee_leave_update_screen.dart';
import 'package:pixel_app/Employee/screens/employee_work_summary.dart';

import 'package:pixel_app/utils/colors.dart';

class EmployeeLeaveScreen extends StatefulWidget {
  const EmployeeLeaveScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeLeaveScreen> createState() => _EmployeeLeaveScreenState();
}

class _EmployeeLeaveScreenState extends State<EmployeeLeaveScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  TextEditingController addEvent = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  EmployeeLeavesViewModel employeeLeavesViewModel =
      Get.put(EmployeeLeavesViewModel());

  EmployeeLeaveDeleteViewModel employeeLeaveDeleteViewModel =
      Get.put(EmployeeLeaveDeleteViewModel());

  @override
  void initState() {
    getLeavesData();
    super.initState();
  }

  Future<void> getLeavesData() async {
    EmployeeLeavesRequestModel employeeLeavesRequestModel =
        EmployeeLeavesRequestModel();

    employeeLeavesRequestModel.search = '';
    employeeLeavesRequestModel.projectStatus = 0;
    employeeLeavesRequestModel.orderBy = 'Asc';
    employeeLeavesRequestModel.startRecord = 0;
    employeeLeavesRequestModel.pageSize = 25;

    await employeeLeavesViewModel
        .employeeLeavesViewModel(employeeLeavesRequestModel);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorUtils.kGrayMain,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text('Leaves',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.kGrayMain)),
                  SizedBox(
                    height: 20,
                  ),
                  GetBuilder<EmployeeLeavesViewModel>(
                    builder: (controller) {
                      if (controller.employeeLeavesApiResponse.status ==
                          Status.COMPLETE) {
                        EmployeeLeavesResponseModel response =
                            controller.employeeLeavesApiResponse.data;
                        return response.data!.data!.length == 0
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: SvgPicture.asset(
                                    'assets/svg/no_leave_found.svg'),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: response.data!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                width: 30,
                                                child: SvgPicture.asset(
                                                  'assets/svg/office-close-day.svg',
                                                  height: 20,
                                                )),
                                            Text(
                                              '${response.data!.data![index].leaveDt!.day}-${response.data!.data![index].leaveDt!.month}-${response.data!.data![index].leaveDt!.year}',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff707070),
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () async {
                                                print('EDIT');
                                                Get.to(
                                                    EmployeeLeaveUpdateScreen(
                                                  leaveDataList: response
                                                      .data!.data![index],
                                                ));
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding: EdgeInsets.all(5),
                                                child: SvgPicture.asset(
                                                    'assets/svg/edit_leave.svg'),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            GestureDetector(
                                              onTap: () async {
                                                print('DELETE');

                                                Get.dialog(
                                                    AlertDialog(
                                                      title: Text(
                                                        'You want to delete the Leave?',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: ColorUtils
                                                              .kGrayLogin,
                                                        ),
                                                      ),
                                                      content: Container(
                                                        // height: 100,
                                                        child: Row(
                                                            // mainAxisSize:
                                                            //     MainAxisSize
                                                            //         .min,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        Get.height *
                                                                            0.06,
                                                                    // width:
                                                                    //     Get.width *
                                                                    //         0.90,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: ColorUtils
                                                                          .kGrayLogin,
                                                                    ),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        'Cancel',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ColorUtils.kWhite,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Expanded(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    EmployeeLeaveDeleteRequestModel
                                                                        employeeLeaveDeleteRequestModel =
                                                                        EmployeeLeaveDeleteRequestModel();

                                                                    employeeLeaveDeleteRequestModel
                                                                            .leaveId =
                                                                        response
                                                                            .data!
                                                                            .data![index]
                                                                            .leaveId;

                                                                    await employeeLeaveDeleteViewModel
                                                                        .employeeLeaveDeleteViewModel(
                                                                            employeeLeaveDeleteRequestModel);

                                                                    if (employeeLeaveDeleteViewModel
                                                                            .apiResponse
                                                                            .status ==
                                                                        Status
                                                                            .COMPLETE) {
                                                                      EmployeeLeaveDeleteResponseModel
                                                                          response =
                                                                          employeeLeaveDeleteViewModel
                                                                              .apiResponse
                                                                              .data;
                                                                      if (response
                                                                              .status ==
                                                                          'success') {
                                                                        getLeavesData();
                                                                        Get.back();
                                                                      } else {
                                                                        Get.snackbar(
                                                                            "Error",
                                                                            'Try again',
                                                                            snackPosition:
                                                                                SnackPosition.BOTTOM);
                                                                      }
                                                                    } else {
                                                                      var response = employeeLeaveDeleteViewModel
                                                                          .apiResponse
                                                                          .data;
                                                                      print(
                                                                          'response :: ${response}');

                                                                      Get.snackbar(
                                                                          "Error",
                                                                          'Try again',
                                                                          snackPosition:
                                                                              SnackPosition.BOTTOM);
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        Get.height *
                                                                            0.06,
                                                                    // width:
                                                                    //     Get.width *
                                                                    //         0.90,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        'Delete',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ColorUtils.kWhite,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                    // barrierDismissible: false,
                                                    barrierColor: Colors.black87
                                                        .withOpacity(0.8));

                                                ///
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding: EdgeInsets.all(5),
                                                child: SvgPicture.asset(
                                                    'assets/svg/delete_icon.svg'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '${response.data!.data![index].leaveNm}',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${response.data!.data![index].leaveTypeNm}',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff707070),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Duration : ',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff707070),
                                                  ),
                                                ),
                                                Text(
                                                  '${response.data!.data![index].durationNm}',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff707070),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                      } else {
                        if (controller.employeeLeavesApiResponse.status ==
                            Status.ERROR) {
                          return Center(child: Text('Something Went Wrong'));
                        }
                        return Container(
                            height: Get.height * 0.65,
                            // width: Get.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            child: Center(child: CircularProgressIndicator()));
                      }
                    },
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Get.to(EmployeeLeaveAddScreen());
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: ColorUtils.kGrayLogin,
                  ),
                  child: const Center(
                    child: Text(
                      'Add Leave',
                      style: TextStyle(
                          color: ColorUtils.kWhite,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
