import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/emplyee_salary_response_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_salary_view_model.dart';
import 'package:pixel_app/Employee/screens/employee_work_summary.dart';

import 'package:pixel_app/utils/colors.dart';

class EmployeeAttendanceScreen extends StatefulWidget {
  const EmployeeAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeAttendanceScreen> createState() =>
      _EmployeeAttendanceScreenState();
}

class _EmployeeAttendanceScreenState extends State<EmployeeAttendanceScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  TextEditingController addEvent = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  EmployeeSalaryViewModel _employeeSalaryViewModel =
      Get.put(EmployeeSalaryViewModel());

  @override
  void initState() {
    _employeeSalaryViewModel.employeeSalaryViewModel();
    super.initState();
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text('Attendance & Salary',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.kGrayMain)),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Color(0xffECEFEF),
              //         border: Border.all(color: ColorUtils.kGrayLogin)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'February 2022',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w600,
              //                 color: Color(0xff455B65)),
              //           ),
              //           SizedBox(
              //             height: 8,
              //           ),
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 border: Border.all(color: Color(0xff444343))),
              //             child: Column(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(10),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.all(5),
              //                         child: Row(
              //                           children: [
              //                             Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   'Present Day',
              //                                   style: TextStyle(
              //                                     fontFamily: 'Roboto',
              //                                     fontWeight: FontWeight.w400,
              //                                     color: Color(0xff444343),
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   height: 10,
              //                                 ),
              //                                 Text(
              //                                   'Work Hour',
              //                                   style: TextStyle(
              //                                     fontFamily: 'Roboto',
              //                                     fontWeight: FontWeight.w400,
              //                                     color: Color(0xff444343),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               width: 30,
              //                             ),
              //                             Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   '24',
              //                                   style: TextStyle(
              //                                     fontFamily: 'Roboto',
              //                                     fontWeight: FontWeight.w700,
              //                                     color: Color(0xff000000),
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   height: 10,
              //                                 ),
              //                                 Text(
              //                                   '270',
              //                                   style: TextStyle(
              //                                     fontFamily: 'Roboto',
              //                                     fontWeight: FontWeight.w700,
              //                                     color: Color(0xff000000),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Column(
              //                         children: [
              //                           Text(
              //                             'Salary',
              //                             style: TextStyle(
              //                               fontFamily: 'Roboto',
              //                               fontWeight: FontWeight.w400,
              //                               color: Color(0xff444343),
              //                             ),
              //                           ),
              //                           SizedBox(
              //                             height: 10,
              //                           ),
              //                           Container(
              //                             padding: EdgeInsets.all(8),
              //                             color: Color(0xff0083CD),
              //                             child: Center(
              //                                 child: Text(
              //                               '15800',
              //                               style: TextStyle(
              //                                   fontFamily: 'Roboto',
              //                                   fontWeight: FontWeight.w500,
              //                                   color: Color(0xffFFFFFF)),
              //                             )),
              //                           )
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Color(0xffECEFEF),
              //         border: Border.all(color: ColorUtils.kGrayLogin)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'February 2022',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w600,
              //                 color: Color(0xff455B65)),
              //           ),
              //           SizedBox(
              //             height: 8,
              //           ),
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 border: Border.all(color: Color(0xff444343))),
              //             child: Column(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(10),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.all(5),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Text(
              //                               'Present Day',
              //                               style: TextStyle(
              //                                 fontFamily: 'Roboto',
              //                                 fontWeight: FontWeight.w400,
              //                                 color: Color(0xff444343),
              //                               ),
              //                             ),
              //                             SizedBox(
              //                               height: 14,
              //                             ),
              //                             Text(
              //                               'Work Hour',
              //                               style: TextStyle(
              //                                 fontFamily: 'Roboto',
              //                                 fontWeight: FontWeight.w400,
              //                                 color: Color(0xff444343),
              //                               ),
              //                             ),
              //                             SizedBox(
              //                               height: 14,
              //                             ),
              //                             Text(
              //                               'Salary',
              //                               style: TextStyle(
              //                                 fontFamily: 'Roboto',
              //                                 fontWeight: FontWeight.w400,
              //                                 color: Color(0xff444343),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.center,
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text(
              //                             '24',
              //                             style: TextStyle(
              //                               fontFamily: 'Roboto',
              //                               fontWeight: FontWeight.w700,
              //                               color: Color(0xff000000),
              //                             ),
              //                           ),
              //                           SizedBox(
              //                             height: 10,
              //                           ),
              //                           Text(
              //                             '270',
              //                             style: TextStyle(
              //                               fontFamily: 'Roboto',
              //                               fontWeight: FontWeight.w700,
              //                               color: Color(0xff000000),
              //                             ),
              //                           ),
              //                           SizedBox(
              //                             height: 10,
              //                           ),
              //                           Container(
              //                             padding: EdgeInsets.all(8),
              //                             color: Color(0xff0083CD),
              //                             child: Center(
              //                                 child: Text(
              //                               '15800',
              //                               style: TextStyle(
              //                                   fontFamily: 'Roboto',
              //                                   fontWeight: FontWeight.w500,
              //                                   color: Color(0xffFFFFFF)),
              //                             )),
              //                           )
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),

              GetBuilder<EmployeeSalaryViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    EmployeeSalaryResponseModel response =
                        controller.apiResponse.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print(
                                'YEAR :: ${response.data![index].date?.year}');
                            print(
                                'MONTH :: ${response.data![index].date?.month}');

                            Get.to(EmployeeWorkSummaryScreen(
                              date: response.data![index].date,
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffECEFEF),
                                  border:
                                      Border.all(color: ColorUtils.kGrayLogin)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    color: Color(0xff455B65),
                                    child: Center(
                                      child: Text(
                                        '${DateFormat.yMMMM().format(DateTime.parse("${response.data![index].date.toString()}"))}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Present Day',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xff444343),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Work Hour',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xff444343),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${response.data![index].pDay}',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '${response.data![index].workHour}',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Salary',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff444343),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: 100,
                                                  padding: EdgeInsets.all(8),
                                                  color: Color(0xff0083CD),
                                                  child: Center(
                                                      child: Text(
                                                    '${response.data![index].salary}',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffFFFFFF)),
                                                  )),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    if (controller.apiResponse.status == Status.ERROR) {
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
            ],
          ),
        ),
      ),
    ));
  }
}
