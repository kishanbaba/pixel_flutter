import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/ViewModel/employee_delete_view_model.dart';
import 'package:pixel_app/Employee/screens/employee_attendance_screen.dart';
import 'package:pixel_app/Employee/screens/employee_change_password.dart';
import 'package:pixel_app/Employee/screens/employee_dashboard_screen.dart';
import 'package:pixel_app/Employee/screens/employee_holiday_screen.dart';
import 'package:pixel_app/Employee/screens/employee_leave_screen.dart';
import 'package:pixel_app/Employee/screens/employee_project_screen.dart';
import 'package:pixel_app/ExternalPackage/RollingBottomBar/rolling_bottom_bar.dart';
import 'package:pixel_app/ExternalPackage/RollingBottomBar/rolling_bottom_bar_item.dart';

import 'package:pixel_app/Services/pref_manager.dart';
import 'package:pixel_app/login_screen.dart';
import 'package:pixel_app/utils/colors.dart';

class EmployeeBottomBarScreen extends StatefulWidget {
  const EmployeeBottomBarScreen({Key? key}) : super(key: key);

  @override
  _EmployeeBottomBarScreenState createState() =>
      _EmployeeBottomBarScreenState();
}

class _EmployeeBottomBarScreenState extends State<EmployeeBottomBarScreen> {
  final _controller = PageController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  EmployeeDeleteViewModel employeeDeleteViewModel =
      Get.put(EmployeeDeleteViewModel());

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
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
                          _key.currentState!.openDrawer();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.centerLeft,
                          // padding:
                          //     EdgeInsets.only(top: 12, bottom: 12, right: 24),
                          // color: Colors.red,
                          child: SvgPicture.asset(
                            'assets/svg/menu.svg',
                          ),
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
                    SizedBox(width: 50),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: -2,
              //   child: Container(
              //     height: 20,
              //     width: Get.width,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.only(
              //           topRight: Radius.circular(20),
              //           topLeft: Radius.circular(20)),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color(0xff73848B),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: 184,
                color: Color(0xff73848B),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 50),
                    Divider(
                      color: Color(0xFFAAAAAA),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            alignment: Alignment.center,
                            child: Text(
                                '${PreferenceManager.getEmployeeId().split('').first}',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Color(0xFF455B65)
                                // color: Colors.yellow,
                                ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // '',
                                  '(${PreferenceManager.getFastName()})',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  // '',
                                  '${PreferenceManager.getEmailId()}',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFFAAAAAA),
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      SizedBox(height: 35),

                      ///Dashboard
                      InkWell(
                        onTap: () {
                          _controller.jumpToPage(0);
                          _key.currentState!.openEndDrawer();

                          // DashBoardScreen();
                          // Get.to(DashBoardScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 30,
                                child: SvgPicture.asset(
                                    'assets/svg/dashboard.svg')),
                            SizedBox(width: 20),
                            Text('Dashboard',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF455B65),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),

                      ///Project
                      InkWell(
                        onTap: () {
                          _controller.jumpToPage(1);
                          _key.currentState!.openEndDrawer();
                          // Get.to(ProjectScreen());
                        },
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 30,
                                child:
                                    SvgPicture.asset('assets/svg/project.svg')),
                            SizedBox(width: 20),
                            Text('Project',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF455B65),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),

                      ///Attendance

                      InkWell(
                        onTap: () {
                          _controller.jumpToPage(2);
                          _key.currentState!.openEndDrawer();
                        },
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 30,
                                child: SvgPicture.asset(
                                  'assets/svg/attendance.svg',
                                  // color: Colors.red,
                                )),
                            // Image.asset('assets/png/attendance.png')
                            SizedBox(width: 20),
                            Text('Attendance',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF455B65),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),

                      ///Leave
                      InkWell(
                        onTap: () {
                          _controller.jumpToPage(3);
                          _key.currentState!.openEndDrawer();
                        },
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 30,
                                child: SvgPicture.asset(
                                  'assets/svg/leave.svg',
                                )),
                            SizedBox(width: 20),
                            Text('Leave',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF455B65),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),

                      ///Holiday
                      InkWell(
                        onTap: () {
                          _controller.jumpToPage(4);
                          _key.currentState!.openEndDrawer();
                        },
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 30,
                                child: SvgPicture.asset(
                                    'assets/svg/office-close-day.svg')),
                            SizedBox(width: 20),
                            Text('Holiday',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF455B65),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),

                      // InkWell(
                      //   onTap: () {
                      //     _controller.jumpToPage(4);
                      //     _key.currentState!.openEndDrawer();
                      //   },
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //           alignment: Alignment.centerLeft,
                      //           width: 30,
                      //           child: SvgPicture.asset(
                      //               'assets/svg/office-close-day.svg')),
                      //       SizedBox(width: 20),
                      //       Text('Office Close day',
                      //           style: TextStyle(
                      //             fontFamily: 'Roboto',
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w500,
                      //             color: Color(0xFF455B65),
                      //           )),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 35),
                      Divider(
                        color: Color(0xFF455B65),
                        thickness: 1,
                      ),
                      SizedBox(height: 35),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 30,
                                child:
                                    SvgPicture.asset('assets/svg/profile.svg')),
                            SizedBox(width: 20),
                            Text('Profile',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF455B65),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      InkWell(
                        onTap: () {
                          Get.to(EmployeeChangePasswordScreen());
                          _key.currentState!.openEndDrawer();
                        },
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 30,
                                child: SvgPicture.asset(
                                    'assets/svg/change-password.svg')),
                            SizedBox(width: 20),
                            Text(
                              'Change password',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF455B65),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      InkWell(
                        onTap: () {
                          Get.offAll(LoginScreen());
                          PreferenceManager.allClearPreferenceManager();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 25),
                          height: 45,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Color(0xFF455B65),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/log-out.svg'),
                              SizedBox(width: 16),
                              Text(
                                'Log out',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GetBuilder<EmployeeDeleteViewModel>(
                        builder: (controller) {
                          return InkWell(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Do you want to Delete Account?',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      actions: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2),
                                            ),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () async {
                                            Get.back();
                                            await controller
                                                .employeeDeleteViewModel();

                                            if (controller.apiResponse.status ==
                                                Status.COMPLETE) {
                                              Get.offAll(LoginScreen());
                                              PreferenceManager
                                                  .allClearPreferenceManager();
                                            } else if (controller
                                                    .apiResponse.status ==
                                                Status.ERROR) {
                                              Get.snackbar('Error',
                                                  '${controller.apiResponse.message}');
                                            } else {
                                              CircularProgressIndicator();
                                            }
                                          },
                                          child: Container(
                                            width: 100,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.red.shade900,
                                              border: Border.all(
                                                  color: Colors.red.shade900,
                                                  width: 2),
                                            ),
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      titlePadding: EdgeInsets.only(
                                          top: 20,
                                          right: 20,
                                          left: 20,
                                          bottom: 10),
                                      actionsPadding:
                                          EdgeInsets.only(bottom: 10, top: 0),
                                    );
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 25),
                              height: 45,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: ColorUtils.kRed,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Delete Account',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            color: ColorUtils.kGrayMain,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: PageView(
            controller: _controller,
            children: <Widget>[
              EmployeeDashboardScreen(),
              EmployeeProjectScreen(),
              EmployeeAttendanceScreen(),
              EmployeeLeaveScreen(),
              EmployeeHolidayScreen(),
              // OfficeCloseScreen(),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          height: Get.height * 0.10,
          color: Colors.white,
          child: RollingBottomBar(
            color: ColorUtils.kGrayMain,
            itemColor: Colors.white,
            controller: _controller,
            flat: true,
            useActiveColorByDefault: false,
            items: const [
              RollingBottomBarItem(Icons.grid_view,
                  label: 'Dashboard', activeColor: Colors.white),
              RollingBottomBarItem(Icons.description_outlined,
                  label: 'Project', activeColor: Colors.white),
              RollingBottomBarItem(Icons.perm_contact_calendar_outlined,
                  label: 'Attendance', activeColor: Colors.white),
              RollingBottomBarItem(Icons.work_off_outlined,
                  label: 'Leave', activeColor: Colors.white),
              RollingBottomBarItem(Icons.calendar_month,
                  label: 'Holiday', activeColor: Colors.white),
              // RollingBottomBarItem(Icons.calendar_month,
              //     label: 'OC-Day', activeColor: Colors.white),
            ],
            enableIconRotation: true,
            onTap: (index) {
              print('_controller..----${index}----${_controller.initialPage}');

              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
            },
          ),
        ),
      ),
    );
  }
}
