import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Client/Screens/dashboard_screen.dart';
import 'package:pixel_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TabController? _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorUtils.kGrayMain,
      key: _key,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 76,
                          width: 76,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.yellow,
                            image: DecorationImage(
                              image: AssetImage('assets/png/person.png'),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '(A)Pixel filme editing',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Pixelfilmeediting@gmail.com',
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
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/dashboard.svg'),
                        SizedBox(width: 43),
                        InkWell(
                          onTap: () {
                            Get.to(DashBoardScreen());
                          },
                          child: Text('Dashboard',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF455B65),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/project.svg'),
                        SizedBox(width: 43),
                        InkWell(
                          onTap: () {
                            // Get.to(ProjectScreen());
                          },
                          child: Text('Project',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF455B65),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/same-day.svg'),
                        SizedBox(width: 43),
                        InkWell(
                          onTap: () {},
                          child: Text('Same day',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF455B65),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/payment.svg'),
                        SizedBox(width: 43),
                        InkWell(
                          onTap: () {},
                          child: Text('Payment',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF455B65),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/office-close-day.svg'),
                        SizedBox(width: 43),
                        InkWell(
                          onTap: () {},
                          child: Text('Office Close day',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF455B65),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Divider(
                      color: Color(0xFF455B65),
                      thickness: 1,
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/profile.svg'),
                        SizedBox(width: 43),
                        InkWell(
                          onTap: () {},
                          child: Text('Profile',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF455B65),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/change-password.svg'),
                        SizedBox(width: 43),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Change password',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF455B65),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    InkWell(
                      onTap: () {},
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.15,
            width: Get.width,
            color: ColorUtils.kGrayMain,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 35,
                    )),
                const SizedBox(
                  width: 90,
                ),
                Container(
                  height: 70,
                  width: 150,
                  child: Image(
                    image: AssetImage('assets/png/ic_logo.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // child: Container(
            //   width: Get.width,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(20),
            //         topLeft: Radius.circular(20)),
            //   ),
            // ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 47,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                    child: TabBar(
                      indicator: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          )
                          // borderRadius: _tabController?.index == 0
                          //     ? BorderRadius.only(
                          //         topLeft: Radius.circular(20),
                          //       )
                          //     : BorderRadius.only(
                          //         topRight: Radius.circular(20),
                          //       ),
                          ),
                      controller: _tabController,
                      tabs: [
                        Text(
                          'Pending Project',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF455A64),
                          ),
                        ),
                        Text(
                          'Finished Project',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF455A64),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: 200,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Total Project : 2',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF455A64),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFECEFEF),
                                    border: Border.all(
                                      color: Color(0xFF455A64),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Mandeep & gurpeet',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/calender.svg'),
                                            SizedBox(width: 10),
                                            Text(
                                              'Delivary Date',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              '05/07/2022',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 43,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFBF9F9),
                                            border: Border.all(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Sangeet',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor: Color(
                                                              0xFF009BFF)
                                                          .withOpacity(0.8)),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Running',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 30),
                                              Text(
                                                '\$20',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 43,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFBF9F9),
                                            border: Border.all(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Wedding',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor: Color(
                                                              0xFF1AD94D)
                                                          .withOpacity(0.8)),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Finalized',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 30),
                                              Text(
                                                '\$50',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 43,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFBF9F9),
                                            border: Border.all(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Recaption',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor: Color(
                                                              0xFFFEC81F)
                                                          .withOpacity(0.8)),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Pending',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 30),
                                              Text(
                                                '\$40',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/svg/right.svg'),
                                              SizedBox(width: 15),
                                              Text(
                                                'Event song',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF000000),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/svg/right.svg'),
                                              SizedBox(width: 15),
                                              Text(
                                                'Highlight song',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF000000),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            'Note:',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color: Color(0xFF000000),
                                          height: 1,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Client Note:',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/svg/note.svg',
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color: Color(0xFF000000),
                                          height: 1,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Due : \$ 110',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                            Text(
                                              'Paid : \$ 00',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 48,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF0C234),
                                                ),
                                                child: Text(
                                                  'Pending',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: 200,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Total Project : 2',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF455A64),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFECEFEF),
                                    border: Border.all(
                                      color: Color(0xFF455A64),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Mandeep & gurpeet',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                            Text(
                                              '\$110',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/calender.svg'),
                                            SizedBox(width: 10),
                                            Text(
                                              'Delivary Date',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              '05/07/2022',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 43,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFBF9F9),
                                            border: Border.all(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Sangeet',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor: Color(
                                                              0xFF009BFF)
                                                          .withOpacity(0.8)),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Running',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 30),
                                              Text(
                                                '\$20',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 43,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFBF9F9),
                                            border: Border.all(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Wedding',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor: Color(
                                                              0xFF1AD94D)
                                                          .withOpacity(0.8)),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Finalized',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 30),
                                              Text(
                                                '\$50',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 43,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFBF9F9),
                                            border: Border.all(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Recaption',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor: Color(
                                                              0xFFFEC81F)
                                                          .withOpacity(0.8)),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Pending',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 30),
                                              Text(
                                                '\$40',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/svg/right.svg'),
                                              SizedBox(width: 15),
                                              Text(
                                                'Event song',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF000000),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/svg/right.svg'),
                                              SizedBox(width: 15),
                                              Text(
                                                'Highlight song',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF000000),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            'Note:',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color: Color(0xFF000000),
                                          height: 1,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Client Note:',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/svg/note.svg',
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color: Color(0xFF000000),
                                          height: 1,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Due : \$ 110',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                            Text(
                                              'Paid : \$ 00',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF455A64),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 48,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF22A944),
                                                ),
                                                child: Text(
                                                  'Finished',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Container(
                                                height: 48,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xFF22A944),
                                                    )),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/right_with_green_bg.svg',
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      'Upload Done',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xFF22A944),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
