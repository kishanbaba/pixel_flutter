import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/same_day_add_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/same_day_add_response_model.dart';
import 'package:pixel_app/Client/ViewModel/same_day_add_viewModel.dart';
import 'package:pixel_app/Client/ViewModel/same_day_viewModel.dart';
import 'package:pixel_app/custom_package/lib/table_calendar.dart';
import 'package:pixel_app/utils/colors.dart';

class SameDayScreen extends StatefulWidget {
  const SameDayScreen({Key? key}) : super(key: key);

  @override
  State<SameDayScreen> createState() => _SameDayScreenState();
}

class _SameDayScreenState extends State<SameDayScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  SameDayAddViewModel _sameDayAddViewModel = Get.put(SameDayAddViewModel());
  // OfficeCloseDayViewModel _officeCloseDayViewModel =
  //     Get.put(OfficeCloseDayViewModel());
  SameDayViewModel _sameDayViewModel = Get.put(SameDayViewModel());

  TextEditingController addEvent = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late final ValueNotifier<List> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    eventLoad();
    // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  // List _getEventsForDay(DateTime day) {
  //   // Implementation example
  //   // return kEvents[day] ?? [];
  // }

  // List _getEventsForRange(DateTime start, DateTime end) {
  //   // Implementation example
  //   // final days = daysInRange(start, end);
  //
  //   return [
  //     for (final d in days) ..._getEventsForDay(d),
  //   ];
  // }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      // print('------------- $_selectedDay');
      print('1111111111 ------------- $selectedDay');
      //
      openAlertDialog();

      // _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  eventLoad() async {
    // OfficeCloseDayRequestModel _req = OfficeCloseDayRequestModel();
    // _req.month = _selectedDay!.month;
    // _req.year = _selectedDay!.year;

    await _sameDayViewModel.sameDayViewModel();

    if (_sameDayViewModel.apiResponse.status == Status.COMPLETE) {
      _sameDayViewModel.sameDayResponse = _sameDayViewModel.apiResponse.data;
    }
  }

  openAlertDialog() {
    print("${DateFormat("dd-MM-y").format(_selectedDay!)}");
    Get.dialog(
        AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Event',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: ColorUtils.kGrayLogin,
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                    addEvent.clear();
                  },
                  child: Icon(Icons.close))
            ],
          ),
          content: Form(
            key: _formKey,
            child: Container(
              // height: 100,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextFormField(
                  controller: addEvent,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Event';
                    }
                    return null;
                  },
                  // expands:
                  //     true,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Enter an event',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffD6D6D6),
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffD6D6D6),
                      ))),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      SameDayAddRequestModel req = SameDayAddRequestModel();

                      // req.emailId = _email.text;
                      // req.loginPass = _password.text;

                      req.qty = 1;
                      req.note = addEvent.text;
                      req.daySameDt =
                          "${DateFormat("dd-MM-y").format(_selectedDay!)}";

                      // req.projectId = item?.projectId;
                      // req.clientNote = clientNote.text;

                      await _sameDayAddViewModel.sameDayAddViewModel(req);
                      if (_sameDayAddViewModel.apiResponse.status ==
                          Status.COMPLETE) {
                        SameDayAddResponseModel response =
                            _sameDayAddViewModel.apiResponse.data;
                        if (response.status == 'success') {
                          print('SUCCESS ');
                          // getProjectData();
                          Get.back();
                          Get.snackbar("Success", 'Event added Successfully',
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          Get.snackbar("Error", '${response.message} ',
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      } else {
                        Get.snackbar("Error",
                            '${_sameDayAddViewModel.apiResponse.message} ',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                      eventLoad();
                      print('test event ------------------------- eventLoad()');
                      Get.back();
                    }
                  },
                  child: Container(
                    height: Get.height * 0.06,
                    width: Get.width * 0.90,
                    decoration: const BoxDecoration(
                      color: ColorUtils.kGrayLogin,
                    ),
                    child: const Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: ColorUtils.kWhite,
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.black87.withOpacity(0.8));
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      // _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      // _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      // _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorUtils.kGrayMain,
      key: _key,
      body: GetBuilder<SameDayViewModel>(builder: (controller) {
        return GetBuilder<SameDayAddViewModel>(builder: (addController) {
          if (controller.apiResponse.status == Status.LOADING) {
            print("loading");
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: ColoredBox(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          if (controller.apiResponse.status == Status.ERROR) {
            print("error");
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: ColoredBox(
                color: Colors.white,
                child: Center(
                  child: Text("Something went wrong!!!!"),
                ),
              ),
            );
          }

          if (controller.apiResponse.status == Status.COMPLETE) {
            return Container(
              height: Get.height,
              // width: Get.width,
              padding: EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text('Same Day',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.kGrayMain)),

                    //         Expanded(
                    //           child: Calendar(
                    //   startOnMonday: false,
                    //
                    //   weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    //   events: _events,
                    //   hideBottomBar: true,
                    //   hideTodayIcon: true,
                    //
                    //   // onDateSelected: (DateTime) {
                    //   //         showDialog(
                    //   //             context: context,
                    //   //             builder: (context) {
                    //   //               return AlertDialog(
                    //   //                 actions: [
                    //   //                   Container(
                    //   //                     height: 200,
                    //   //                     width: double.infinity,
                    //   //                   )
                    //   //                 ],
                    //   //               );
                    //   //             });
                    //   // },
                    //
                    //   // eventListBuilder:
                    //   //     (BuildContext context, List<CleanCalendarEvent> events) {
                    //   //   return Container(
                    //   //     height: 50,
                    //   //     width: 350,
                    //   //     decoration:
                    //   //         BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    //   //   );
                    //   // },
                    //   isExpandable: true,
                    //
                    //   eventDoneColor: Colors.green,
                    //   selectedColor: Colors.pink,
                    //
                    //   todayColor: Colors.blue,
                    //   eventColor: Colors.grey,
                    //   locale: 'en_US',
                    //   // todayButtonText: 'Heute',
                    //   isExpanded: true,
                    //   expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                    //   dayOfWeekStyle: const TextStyle(
                    //             color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
                    // ),
                    //         ),

                    TableCalendar(
                      firstDay: DateTime.utc(1990, 01, 01),
                      lastDay: DateTime.utc(2100, 12, 31),

                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      rangeStartDay: _rangeStart,
                      rangeEndDay: _rangeEnd,
                      calendarFormat: _calendarFormat,
                      rangeSelectionMode: _rangeSelectionMode,
                      // eventLoader: _getEventsForDay,
                      startingDayOfWeek: StartingDayOfWeek.sunday,

                      headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(color: Colors.white),
                          // decoration: BoxDecoration(
                          //     color: Colors.pink, shape: BoxShape.circle),
                          leftChevronIcon: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.blue,
                            size: 20,
                          ),
                          rightChevronIcon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.blue,
                            size: 20,
                          )),

                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700),
                          weekendStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700)),
                      calendarStyle: CalendarStyle(
                          // cellMargin:
                          //     EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          outsideDaysVisible: false,
                          markerSize: 0,
                          disabledTextStyle: TextStyle(color: Colors.red),
                          weekendTextStyle: TextStyle(color: Colors.red),
                          selectedTextStyle: TextStyle(color: Colors.black),
                          selectedDecoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                          todayTextStyle: TextStyle(color: Colors.black),
                          todayDecoration:
                              BoxDecoration(color: Colors.transparent),
                          holidayTextStyle: TextStyle(color: Colors.red)),
                      onDaySelected: _onDaySelected,
                      onRangeSelected: _onRangeSelected,
                      // onFormatChanged: (format) {
                      //   if (_calendarFormat != format) {
                      //     setState(() {
                      //       _calendarFormat = format;
                      //     });
                      //   }
                      // },
                      onPageChanged: (focusedDay) async {
                        setState(() {
                          _focusedDay = focusedDay;
                        });

                        print("--------------- $_focusedDay");
                        print("-------------- ${_focusedDay.month}");

                        // OfficeCloseDayRequestModel _req =
                        //     OfficeCloseDayRequestModel();
                        // _req.month = _focusedDay.month;
                        // _req.year = _focusedDay.year;
                        //
                        // await officeController.officeCloseDayViewModel(_req);
                        //
                        // if (officeController.apiResponse.status ==
                        //     Status.COMPLETE) {
                        //   controller.sameDayResponse =
                        //       _officeCloseDayViewModel.apiResponse.data;
                        // }
                      },
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.sameDayResponse!.data!.length,
                      // separatorBuilder: (_, index) {
                      //   return Padding(
                      //       padding: const EdgeInsets.symmetric(vertical: 7.5));
                      // },
                      itemBuilder: (_, index) {
                        controller.sameDayResponse!.data!.sort(
                            (a, b) => a.daySameDt!.compareTo(b.daySameDt!));

                        print("--------------  ${_focusedDay.month}");
                        print(
                            "-------------- api data ${DateFormat("M").format(DateTime.parse("${controller.sameDayResponse!.data![index].daySameDt}"))}");
                        print(
                            "--------------  conditions  ${_focusedDay.month.toString() == DateFormat("M").format(DateTime.parse("${controller.sameDayResponse!.data![index].daySameDt}"))}");

                        if (_focusedDay.month.toString() ==
                            DateFormat("M").format(DateTime.parse(
                                "${controller.sameDayResponse!.data![index].daySameDt}"))) {
                          return Container(
                            width: Get.width,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                border:
                                    Border.all(color: ColorUtils.kGrayMain)),
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 50,
                                        color: ColorUtils.kGrayMain,
                                        child: Text(
                                          // '${item.dayEditDt}',
                                          "${DateFormat("d").format(DateTime.parse("${controller.sameDayResponse!.data![index].daySameDt}"))}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      width: Get.width * .52,
                                      child: Text(
                                        "${controller.sameDayResponse!.data![index].note!.split(", ").last}",
                                        softWrap: true,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 65,
                                      child: Text(
                                        "${controller.sameDayResponse!.data![index].daySameDay}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: ColorUtils.kGrayMain,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }

          return SizedBox();
        });
      }),
    ));
  }
}
