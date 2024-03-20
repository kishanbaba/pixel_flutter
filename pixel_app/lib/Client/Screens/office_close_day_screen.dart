import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/office_close_day_request_model.dart';
import 'package:pixel_app/Client/ViewModel/office_close_day_viewModel.dart';
import 'package:pixel_app/custom_package/lib/table_calendar.dart';
import 'package:pixel_app/utils/colors.dart';

class OfficeCloseScreen extends StatefulWidget {
  const OfficeCloseScreen({Key? key}) : super(key: key);

  @override
  State<OfficeCloseScreen> createState() => _OfficeCloseScreenState();
}

class _OfficeCloseScreenState extends State<OfficeCloseScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  OfficeCloseDayViewModel _officeCloseDayViewModel =
      Get.put(OfficeCloseDayViewModel());

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

  eventLoad() async {
    OfficeCloseDayRequestModel _req = OfficeCloseDayRequestModel();
    _req.month = DateTime.now().month;
    _req.year = DateTime.now().year;

    await _officeCloseDayViewModel.officeCloseDayViewModel(_req);

    if (_officeCloseDayViewModel.apiResponse.status == Status.COMPLETE) {
      _officeCloseDayViewModel.pageResponse =
          _officeCloseDayViewModel.apiResponse.data;
    }
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

      // _selectedEvents.value = _getEventsForDay(selectedDay);
    }
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
      body: GetBuilder<OfficeCloseDayViewModel>(builder: (controller) {
        // if (controller.apiResponse.status == Status.LOADING) {
        //   return Container(
        //     height: Get.height,
        //     width: Get.width,
        //     color: Colors.white,
        //     child: Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   );
        // }

        if (controller.apiResponse.status == Status.COMPLETE) {
          return Container(
            height: Get.height,
            // width: Get.width,
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
                  Text('Office Close Day',
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
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
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
                            borderRadius: BorderRadius.circular(150)),
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
                      _focusedDay = focusedDay;

                      OfficeCloseDayRequestModel _req =
                          OfficeCloseDayRequestModel();
                      _req.month = _focusedDay.month;
                      _req.year = _focusedDay.year;

                      await controller.officeCloseDayViewModel(_req);

                      if (controller.apiResponse.status == Status.COMPLETE) {
                        controller.pageResponse = controller.apiResponse.data;
                      }
                    },
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.pageResponse!.data!.length,
                    // separatorBuilder: (_, index) {
                    //   return Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 7.5));
                    // },
                    itemBuilder: (_, index) {
                      return Container(
                        width: Get.width,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            border: Border.all(color: ColorUtils.kGrayMain)),
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
                                      "${DateFormat("d").format(DateTime.parse("${controller.pageResponse!.data![index].holidayDt}"))}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: Get.width * .52,
                                  child: Text(
                                      "${controller.pageResponse!.data![index].holidayNm}",
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ),
                                Spacer(),
                                Container(
                                  width: 65,
                                  child: Text(
                                      "${controller.pageResponse!.data![index].holidayDay}",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: ColorUtils.kGrayMain,
                                          fontWeight: FontWeight.w100)),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          {
            return Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
        return SizedBox();
      }),
    ));
  }
}
