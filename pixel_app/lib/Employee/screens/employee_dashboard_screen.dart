import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_checkin_checkout_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_checkin_checkout_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_dashboard_response_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_checkin_checkout_view_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_dashboard_view_model.dart';
import 'package:pixel_app/utils/colors.dart';

class EmployeeDashboardScreen extends StatefulWidget {
  const EmployeeDashboardScreen({Key? key}) : super(key: key);

  @override
  _EmployeeDashboardScreenState createState() =>
      _EmployeeDashboardScreenState();
}

class _EmployeeDashboardScreenState extends State<EmployeeDashboardScreen> {
  EmployeeDashboardViewModel employeeDashboardViewModel =
      Get.put(EmployeeDashboardViewModel());

  EmployeeCheckInCheckOutViewModel employeeCheckInCheckOutViewModel =
      Get.put(EmployeeCheckInCheckOutViewModel());
  // DateTime? timeString;
  bool isCheckOut = false;
  @override
  void initState() {
    employeeDashboardViewModel.employeeDashboardViewModel();
    employeeDashboardViewModel.timer();
    // timeString = DateTime.now();
    // Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  // void _getTime() {
  // final DateTime now = DateTime.now();
  // final String formattedDateTime = DateFormat('MM/dd/yyyy hh:mm:ss').format(now);
  // setState(() {
  //   timeString = DateTime.now();
  // });
  // }

  static String formatISOTime({required DateTime date}) {
    var duration = date.timeZoneOffset;
    print('durationduration ${duration.isNegative}');
    if (duration.isNegative)
      return (date.toIso8601String() +
          "-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    else
      return (date.toIso8601String() +
          "+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  }

  checkInCheckOut() async {
    EmployeeCheckInCheckOutRequestModel employeeCheckInCheckOutRequestModel =
        EmployeeCheckInCheckOutRequestModel();

    print('-DateTime.now()--${DateTime.now()}');

    employeeCheckInCheckOutRequestModel.checkInOut =
        formatISOTime(date: DateTime.now());

    print(
        '--employeeCheckInCheckOutRequestModel.checkInOut--${employeeCheckInCheckOutRequestModel.checkInOut}');

    await employeeCheckInCheckOutViewModel
        .employeeCheckInCheckOutViewModel(employeeCheckInCheckOutRequestModel);

    if (employeeCheckInCheckOutViewModel.apiResponse.status ==
        Status.COMPLETE) {
      EmployeeCheckInCheckOutResponseModel
          employeeCheckInCheckOutResponseModel =
          employeeCheckInCheckOutViewModel.apiResponse.data;
      print(
          '--employeeCheckInCheckOutResponseModel--${employeeCheckInCheckOutResponseModel.message}');
      await employeeDashboardViewModel.employeeDashboardViewModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.kGrayMain,
        body: Container(
          height: Get.height,
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        color: ColorUtils.kGrayMain,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<EmployeeDashboardViewModel>(
                    builder: (controller) {
                      if (controller.apiResponse.status == Status.COMPLETE) {
                        EmployeeDashboardResponseModel response =
                            controller.apiResponse.data;
                        // print('REPEAT REP{EAT ');
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            response.data?.checkInOut == null
                                ? Container(
                                    padding: EdgeInsets.only(
                                        left: 15,
                                        right: 10,
                                        top: 15,
                                        bottom: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xFF000000),
                                        )),
                                    child: Row(children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: SvgPicture.asset(
                                              'assets/svg/timer_black.svg',
                                              height: 17,
                                              width: 17,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${DateFormat('jm').format(controller.timeString)}',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '${DateFormat('d-MM-y EEEE').format(DateTime.now())}',
                                                // '07-02-2022   Sunday',
                                                style: TextStyle(
                                                  color: Color(0xFF728289),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          print('CHECK IN');
                                          checkInCheckOut();
                                        },
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.center,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF455B65)),
                                          child: Text(
                                            'Check in',
                                            style: TextStyle(
                                                color: ColorUtils.kWhite,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    ]),
                                  )
                                : Container(
                                    padding: EdgeInsets.only(
                                        left: 15,
                                        right: 10,
                                        top: 15,
                                        bottom: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xFF000000),
                                        )),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: SvgPicture.asset(
                                              'assets/svg/timer_black.svg',
                                              height: 17,
                                              width: 17,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // '${controller.timeString}',
                                                '${DateFormat('jm').format(controller.timeString)}',
                                                // '6:30 AM',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '${DateFormat('d-MM-y EEEE').format(response.data!.checkInOut!.checkIn!)}',
                                                // '07-02-2022   Sunday',
                                                style: TextStyle(
                                                  color: Color(0xFF728289),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Check in at ${DateFormat('jm').format(response.data!.checkInOut!.checkIn!)}',
                                                style: TextStyle(
                                                  color: Color(0xFF728289),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              print('CHECK OUT');
                                              checkInCheckOut();
                                            },
                                            child: Container(
                                              width: 100,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0083CD)),
                                              child: Text(
                                                'Check out',
                                                style: TextStyle(
                                                    color: ColorUtils.kWhite,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            response.data!.attendance!.isNotEmpty
                                ? Container(
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: ColorUtils.kGrayMain,
                                    )),
                                      child: ExpansionTile(
                                      tilePadding: EdgeInsets.all(0),
                                      childrenPadding: EdgeInsets.all(0),
                                      leading: Container(
                                        alignment: Alignment.center,
                                        height: 55,
                                        width: 55,
                                        color: Color(0xFF455A64),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              // "0",
                                              '${response.data!.attendance![0].checkIn!.split('-').first}',
                                              // '${item.dayEditDt}',
                                              // "${DateFormat("d").format(DateTime.parse("${controller.sameDayResponse!.data![index].daySameDt}"))}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              // "1",
                                              '${response.data!.attendance![0].checkInDay?.substring(0, 3)}',
                                              // '${item.dayEditDt}',
                                              // "${DateFormat("d").format(DateTime.parse("${controller.sameDayResponse!.data![index].daySameDt}"))}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ),
                                            // Text(
                                            //   'Mon',
                                            //   // '${item.dayEditDt}',
                                            //   // "${DateFormat("d").format(DateTime.parse("${controller.sameDayResponse!.data![index].daySameDt}"))}",
                                            //   style: TextStyle(
                                            //       color: Colors.white,
                                            //       fontWeight: FontWeight.w500,
                                            //       fontSize: 12),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      title: Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/svg/timer_black.svg',
                                                  height: 17,
                                                  width: 17,
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    // '${response.data!.attendance![0].checkIn!.split('-').first}',
                                                    "${response.data!.attendance![0].workHour} Work Hour",
                                                    // "2",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF444343),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 80,
                                                  child: Text(
                                                      "₹ ${response.data!.attendance![0].salary}",
                                                      // "3",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ColorUtils
                                                              .kGrayMain,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      children: [
                                        Divider(
                                          color: Colors.black,
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: Get.width * 0.25,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Check In',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff455B65),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: Get.width * 0.25,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Check Out',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff455B65),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: Get.width * 0.25,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Work Duration',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff455B65),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: response
                                              .data!
                                              .attendance![0]
                                              .attendanceDetails
                                              ?.length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (BuildContext context,
                                              int index1) {
                                            // print(
                                            //     'LENGTH--${response.data!.attendance![0].attendanceDetails!.length}');

                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 5),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: Get.width * 0.25,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '${response.data!.attendance![0].attendanceDetails![index1].checkIn}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff444343),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Get.width * 0.25,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '${response.data!.attendance![0].attendanceDetails![index1].checkOut}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff444343),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Get.width * 0.25,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '${response.data!.attendance![0].attendanceDetails![index1].workHour}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff444343),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Column(
                                        //         children: [
                                        //           Text(
                                        //             '9:35 AM',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             height: 10,
                                        //           ),
                                        //           Text(
                                        //             '2:35 AM',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             height: 10,
                                        //           ),
                                        //           Text(
                                        //             '9:35 AM',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       Column(
                                        //         children: [
                                        //           Text(
                                        //             '1:35 PM',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             height: 10,
                                        //           ),
                                        //           Text(
                                        //             '6:35 PM',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             height: 10,
                                        //           ),
                                        //           Text(
                                        //             '9:35 PM',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       Column(
                                        //         children: [
                                        //           Text(
                                        //             '3 Hour 50 min',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             height: 10,
                                        //           ),
                                        //           Text(
                                        //             '3 Hour 55 min',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             height: 10,
                                        //           ),
                                        //           Text(
                                        //             '3 Hour 50 min',
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w400,
                                        //               color: Color(0xff444343),
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            response.data?.attendance != []
                                ? SizedBox(
                                    height: 20,
                                  )
                                : SizedBox(),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color(0xFF000000),
                                    )),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        //
                                        Container(
                                          width: 30,
                                          child: SvgPicture.asset(
                                            'assets/svg/events.svg',
                                            // height: 17,
                                            // width: 17,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                            width: Get.width * 0.55,
                                            child: Text(
                                              'Events',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )),
                                        Spacer(),
                                        Container(
                                            width: Get.width * 0.1,
                                            child: Text(
                                              '${response.data?.events![0].projectEventId}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        //
                                        Container(
                                          width: 30,
                                          child: SvgPicture.asset(
                                            'assets/svg/timer_black.svg',
                                            // height: 17,
                                            // width: 17,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                            width: Get.width * 0.55,
                                            child: Text(
                                              'Sync Hour',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )),
                                        Spacer(),
                                        Container(
                                            width: Get.width * 0.1,
                                            child: Text(
                                              '${response.data?.events![0].syncHourValue}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        //
                                        Container(
                                          width: 30,
                                          child: SvgPicture.asset(
                                            'assets/svg/timer_black.svg',
                                            // height: 17,
                                            // width: 17,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                            width: Get.width * 0.55,
                                            child: Text(
                                              'Work Hour',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )),
                                        Spacer(),
                                        Container(
                                            width: Get.width * 0.1,
                                            child: Text(
                                              '${response.data?.events![0].syncWorkHour}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        );
                      } else {
                        if (controller.apiResponse.status == Status.ERROR) {
                          return Center(child: Text('Something Went Wrong'));
                        }
                        return Container(
                            height: Get.height * 0.65,
                            width: Get.width,
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
