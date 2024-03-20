import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/dashboard_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/dashboard_response_model.dart';
import 'package:pixel_app/Client/ViewModel/dashboard_view_model.dart';
import 'package:pixel_app/utils/colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardViewModel dashboardViewModel = Get.put(DashboardViewModel());

  @override
  void initState() {
    getProjectData();
    super.initState();
  }

  Future<void> getProjectData() async {
    DashboardRequestModel req = DashboardRequestModel();

    req.date =
        '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
    print('----req.date---${req.date}');
    await dashboardViewModel.dashboardViewModel(req);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.kGrayMain,
      body: GetBuilder<DashboardViewModel>(
        builder: (controller) {
          if (dashboardViewModel.apiResponse.status == Status.COMPLETE) {
            DashboardResponseModel responseModel =
                dashboardViewModel.apiResponse.data;
            return Container(
                height: Get.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(15),
                                // width: Get.width * 0.50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF455A64).withOpacity(
                                      0.5,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/png/pending_amount.png'),
                                          height: 18,
                                          width: 18,
                                          color: Color(0xFF455B65),
                                        ),
                                        SizedBox(width: 10),
                                        Flexible(
                                          child: Text(
                                            'Pending Amount',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Color(0xff707070),
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${responseModel.data?.pendingAmount ?? ''}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(15),
                                // width: Get.width * 0.50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF455A64).withOpacity(
                                      0.5,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/png/pending_project.png'),
                                          height: 18,
                                          width: 18,
                                          color: Color(0xFF455B65),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Pending Project',
                                          style: TextStyle(
                                            color: Color(0xff707070),
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${responseModel.data?.pendingProject ?? ''}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      responseModel.data?.projects!.length == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: SvgPicture.asset(
                                  'assets/svg/no_data_found.svg'),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.builder(
                                itemCount: responseModel.data?.projects!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item =
                                      responseModel.data?.projects![index];

                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                    ),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 5),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${item?.projectNm ?? ''}',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF000000),
                                                  ),
                                                ),
                                                Text(
                                                  '${item?.currencySymbol ?? ''}${item?.price ?? ''}',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16,
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
                                                  'Delivery Date :',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF455A65),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  // '05/07/2022',
                                                  '${item?.deliveryDt?.day ?? ''}/${item?.deliveryDt?.month ?? ''}/${item?.deliveryDt?.year ?? ''}',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF455A64),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          ListView.builder(
                                            itemCount:
                                                item?.projectEvents?.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var eventData =
                                                  item?.projectEvents?[index];

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 0),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  height: 43,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFFFFF),
                                                    border: Border.all(
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: Get.width * 0.4,
                                                        child: Text(
                                                          '${eventData?.eventName ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CircleAvatar(
                                                              radius: 6,
                                                              backgroundColor: '${eventData?.eventStatus ?? ''}' ==
                                                                      'RUNNING'
                                                                  ? Color(0xFF009BFF)
                                                                      .withOpacity(
                                                                          0.8)
                                                                  : '${eventData?.eventStatus ?? ''}' ==
                                                                          'FINALIZED'
                                                                      ? Color(0xFF1AD94D)
                                                                          .withOpacity(
                                                                              0.8)
                                                                      : '${eventData?.eventStatus ?? ''}' ==
                                                                              'PENDING'
                                                                          ? Color(
                                                                              0xFFFEC81F)
                                                                          : Color(0xFF009BFF)
                                                                              .withOpacity(0.8)),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            '${eventData?.eventStatus ?? ''}',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xFF444444),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                    ],
                  ),
                ));
          } else {
            return Container(
                height: double.infinity,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
