import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_attendance_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_attendance_response_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_attendance_view_model.dart';
import 'package:pixel_app/utils/colors.dart';

class EmployeeWorkSummaryScreen extends StatefulWidget {
  final DateTime? date;

  const EmployeeWorkSummaryScreen({
    Key? key,
    this.date,
  }) : super(key: key);

  @override
  _EmployeeWorkSummaryScreenState createState() =>
      _EmployeeWorkSummaryScreenState();
}

class _EmployeeWorkSummaryScreenState extends State<EmployeeWorkSummaryScreen> {
  EmployeeAttendanceViewModel _employeeAttendanceViewModel =
      Get.put(EmployeeAttendanceViewModel());
  @override
  void initState() {
    _employeeAttendanceViewModel.userSelectedDate = widget.date;
    getAttendanceDetails();
    super.initState();
  }

  Future<void> getAttendanceDetails() async {
    EmployeeAttendanceRequestModel data = EmployeeAttendanceRequestModel();
    // _employeeAttendanceViewModel.userSelectedDate = widget.date;

    data.month = _employeeAttendanceViewModel.userSelectedDate!.month;
    data.year = _employeeAttendanceViewModel.userSelectedDate!.year;
    await _employeeAttendanceViewModel.employeeAttendanceViewModel(data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.kGrayMain,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: Get.height * 0.16,
                color: ColorUtils.kGrayMain,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.white,
                          size: 25,
                        )),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 150,
                          child: Image(
                            image: AssetImage('assets/png/ic_logo.png'),
                          ),
                        ),
                        Text('Your wedding video editing partner',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))
                      ],
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: GetBuilder<EmployeeAttendanceViewModel>(
            builder: (controller) {
              print('STATUS==${controller.apiResponse.status}');
              if (controller.apiResponse.status == Status.COMPLETE) {
                EmployeeAttendanceResponseModel res =
                    controller.apiResponse.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              controller.dateDecrement();
                              // Future.delayed(Duration(seconds: 1), () async {
                              //   GetHabitRecordDateRequestModel _request =
                              //       GetHabitRecordDateRequestModel();
                              //   _request.userId = PreferenceManager.getUId();
                              //   print(
                              //       "date decrement ---------------- $finalDate");
                              //   _request.date = finalDate;
                              //   await _getHabitRecordDateViewModel
                              //       .getHabitRecordDateViewModel(model: _request);
                              //   gh.GetHabitRecordDateResponseModel resp =
                              //       _getHabitRecordDateViewModel.apiResponse.data;
                              //   recordResponse = resp;
                              //   print(
                              //       'date counter ----------------- $userSelectedDate');
                              // }).then((value) => preCompleteHabit());
                              // _habitViewModel.tmpHabitUpdatesList.clear();

                              // setState(() {});
                              getAttendanceDetails();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: ColorUtils.kGrayMain,
                              size: 20,
                            ),
                          ),
                          // SizedBox(width: Get.height * .04),
                          InkWell(
                            // onTap: () {
                            //   DatePicker.showDatePicker(context,
                            //       theme: DatePickerTheme(
                            //           backgroundColor: ColorUtils.kBlack,
                            //           cancelStyle:
                            //               FontTextStyle.kTine16W400Roboto,
                            //           doneStyle: FontTextStyle.kTine16W400Roboto,
                            //           itemStyle:
                            //               FontTextStyle.kWhite16W300Roboto),
                            //       showTitleActions: true,
                            //       minTime: DateTime(2019, 1, 1),
                            //       maxTime: DateTime.now(), onChanged: (date) {
                            //     userSelectedDate = date;
                            //     print('change $date');
                            //   }, onConfirm: (date) async {
                            //     setState(() {});
                            //     userSelectedDate = date;
                            //
                            //     Future.delayed(Duration(seconds: 1), () async {
                            //       GetHabitRecordDateRequestModel _request =
                            //           GetHabitRecordDateRequestModel();
                            //
                            //       _request.userId = PreferenceManager.getUId();
                            //       print(
                            //           "date increment ---------------- $finalDate");
                            //
                            //       _request.date = finalDate;
                            //       await _getHabitRecordDateViewModel
                            //           .getHabitRecordDateViewModel(
                            //               model: _request);
                            //       gh.GetHabitRecordDateResponseModel resp =
                            //           _getHabitRecordDateViewModel
                            //               .apiResponse.data;
                            //
                            //       recordResponse = resp;
                            //       print(
                            //           'date counter ----------------- $userSelectedDate');
                            //     }).then((value) => preCompleteHabit());
                            //
                            //     // setState(() {});
                            //   },
                            //       currentTime: userSelectedDate,
                            //       locale: LocaleType.en);
                            // },

                            child: Text(
                                '${DateFormat('MMMM y').format(controller.userSelectedDate!)}',
                                style: TextStyle(
                                    color: ColorUtils.kGrayMain,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto')),
                          ),
                          // SizedBox(width: Get.height * .04),
                          InkWell(
                            onTap: () async {
                              controller.dateIncrement();
                              getAttendanceDetails();
                              // Future.delayed(Duration(seconds: 1), () async {
                              //   GetHabitRecordDateRequestModel _request =
                              //       GetHabitRecordDateRequestModel();
                              //
                              //   _request.userId = PreferenceManager.getUId();
                              //   print(
                              //       "date increment ---------------- $finalDate");
                              //
                              //   _request.date = finalDate;
                              //   await _getHabitRecordDateViewModel
                              //       .getHabitRecordDateViewModel(model: _request);
                              //   gh.GetHabitRecordDateResponseModel resp =
                              //       _getHabitRecordDateViewModel.apiResponse.data;
                              //
                              //   recordResponse = resp;
                              //   print(
                              //       'date counter ----------------- $userSelectedDate');
                              // }).then((value) => preCompleteHabit());
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorUtils.kGrayMain,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: res.data!.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${res.data![index].checkIn!.split('-').first}',
                                        // '${item.dayEditDt}',
                                        // "${DateFormat("d").format(DateTime.parse("${controller.sameDayResponse!.data![index].daySameDt}"))}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        '${res.data![index].checkInDay}',
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
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "${res.data![index].workHour} Work Hour",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF444343),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 80,
                                            child: Text(
                                                "₹ ${res.data![index].salary}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: ColorUtils.kGrayMain,
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
                                    itemCount: res
                                        .data![index].attendanceDetails!.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index1) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: Get.width * 0.25,
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${res.data![index].attendanceDetails![index1].checkIn}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff444343),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width * 0.25,
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${res.data![index].attendanceDetails![index1].checkOut}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff444343),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width * 0.25,
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${res.data![index].attendanceDetails![index1].workHour}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff444343),
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
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 20),
                        color: Color(0xff455A64),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '320  Work Hour',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '₹ 500',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                if (controller.apiResponse.status == Status.ERROR) {
                  return Center(
                    child: Text('Somthing Went Wrong'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
