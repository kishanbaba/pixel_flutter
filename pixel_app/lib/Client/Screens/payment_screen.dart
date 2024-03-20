import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_payment_request_model.dart';
import 'package:pixel_app/Client/ViewModel/client_payment_view_model.dart';
import 'package:pixel_app/Services/pref_manager.dart';
import 'package:pixel_app/utils/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../Api/Model/ResponseModel/client_payment_response_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  ClientPaymentViewModel _clientPaymentViewModel =
      Get.put(ClientPaymentViewModel());
  TextEditingController searchController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  // String lastDate =
  //     '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  String lastDate = '25/07/2022';
  @override
  void initState() {
    getClientPaymentDetails();
    super.initState();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 1).toString());
    // pageSize = pageSize + 25;
    // print('--pageSize--${pageSize}');
    await getClientPaymentDetails();

    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  Future<void> getClientPaymentDetails({String search = ''}) async {
    ClientPaymentRequestModel req = ClientPaymentRequestModel();
    req.clientId = int.parse(PreferenceManager.getClientId());
    // req.date =
    //     '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

    req.date = lastDate;

    // req.pageSize = 25;
    // req.orderBy = "Asc";
    // req.search = search;
    // req.startRecord = 0;
    await _clientPaymentViewModel.clientPaymentViewModel(req);
  }

  var now = new DateTime.now();
  var formatter = new DateFormat('MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: InkWell(
        //   onTap: () {
        //     ///BOTTOM SHEET
        //     Get.bottomSheet(Container(
        //       height: 200,
        //       width: Get.width,
        //       padding: EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius:
        //               BorderRadius.vertical(top: Radius.circular(20))),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'Search',
        //             style: TextStyle(
        //               fontFamily: 'Roboto',
        //               fontSize: 20,
        //               fontWeight: FontWeight.w400,
        //               color: Color(0xFF000000),
        //             ),
        //           ),
        //           SizedBox(height: 10),
        //           TextFormField(
        //             controller: searchController,
        //             // validator:
        //             //     (value) {
        //             //   if (value == null || value.isEmpty) {
        //             //     return 'Please Enter Notes';
        //             //   }
        //             //   return null;
        //             // },
        //             // minLines:
        //             // 3,
        //             // expands:
        //             //     true,
        //             // maxLines: null,
        //
        //             decoration: InputDecoration(
        //                 suffixIcon: Icon(Icons.search),
        //                 hintText: 'Search....',
        //                 border: OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                   color: Color(0xffD6D6D6),
        //                 )),
        //                 focusedBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                   color: Color(0xffD6D6D6),
        //                 ))),
        //           ),
        //           Spacer(),
        //           InkWell(
        //             onTap: () {
        //               getClientPaymentDetails(search: searchController.text);
        //               Get.back();
        //             },
        //             child: Container(
        //               margin: EdgeInsets.symmetric(horizontal: 15),
        //               height: 48,
        //               width: Get.width,
        //               decoration: const BoxDecoration(
        //                 color: ColorUtils.kGrayLogin,
        //               ),
        //               child: const Center(
        //                 child: Text(
        //                   'Search',
        //                   style: TextStyle(
        //                       color: ColorUtils.kWhite,
        //                       fontSize: 18,
        //                       fontFamily: 'Roboto',
        //                       fontWeight: FontWeight.w500),
        //                 ),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ));
        //   },
        //   child: Container(
        //     margin: EdgeInsets.only(bottom: 75),
        //     child: CircleAvatar(
        //       radius: 35,
        //       backgroundColor: Color(0xFF455A64),
        //       child: SvgPicture.asset('assets/svg/filter.svg',
        //           height: 45, width: 45),
        //     ),
        //   ),
        // ),
        backgroundColor: ColorUtils.kGrayMain,
        body: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: GetBuilder<ClientPaymentViewModel>(
            builder: (controller) {
              if (controller.apiResponse.status == Status.COMPLETE) {
                ClientPaymentResponseModel response =
                    controller.apiResponse.data;

                return SmartRefresher(
                  enablePullDown: false,
                  enablePullUp: true,
                  physics: BouncingScrollPhysics(),
                  onLoading: _onLoading,
                  onRefresh: _onRefresh,
                  // header: WaterDropHeader(),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus? mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = SizedBox();
                      } else if (mode == LoadStatus.loading) {
                        body = CircularProgressIndicator();
                      } else if (mode == LoadStatus.failed) {
                        body = Text("Load Failed!Click retry!");
                      } else if (mode == LoadStatus.canLoading) {
                        print(
                            '--response.data.tbData.last.dt--${response.data!.tbData!.last.dt?.split('-')}');

                        lastDate =
                            '${DateTime.now().day}/${response.data!.tbData!.last.dt?.split('-').first}/${response.data!.tbData!.last.dt?.split('-').last}';

                        body = SizedBox();
                      } else {
                        body = Text("No more Data");
                      }
                      return Center(child: body);
                    },
                  ),
                  controller: _refreshController,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(
                              color: ColorUtils.kGrayMain,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          // height: Get.height * 0.10,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                width: Get.width * 0.50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Due Amount',
                                      style: TextStyle(
                                        color: Color(0xff707070),
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$ ${response.data!.dueAmount}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                width: Get.width * 0.50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Paid Amount',
                                      style: TextStyle(
                                        color: Color(0xff707070),
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$  ${response.data!.paidAmount}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 3,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Padding(
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        //   child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(
                        //       'July, 2022',
                        //       style: TextStyle(
                        //           fontFamily: 'Roboto',
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: 16,
                        //           color: Colors.black),
                        //     ),
                        //   ),
                        // ),
                        response.data!.tbData!.length == 0
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: SvgPicture.asset(
                                    'assets/svg/no_data_found.svg'),
                              )
                            : ListView.builder(
                                itemCount: response.data!.tbData!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item = response.data!.tbData![index];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            item.dt!,
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        itemCount: item.payments!.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var item1 = item.payments![index];
                                          return Container(
                                            width: Get.width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Color(0xffFBF9F9),
                                                border: Border.all(
                                                    color:
                                                        ColorUtils.kGrayMain)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 50,
                                                        width: 50,
                                                        color: ColorUtils
                                                            .kGrayMain,
                                                        child: Text(
                                                          // '${item.dayEditDt}',
                                                          "${DateFormat("d").format(DateTime.parse("${item1.paymentDt}"))}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 20),
                                                        )),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      width: Get.width * .59,
                                                      child: Text(
                                                        item1.projectName!,
                                                        // "${controller.sameDayResponse!.data![index].holidayNm}",
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      width: 65,
                                                      child: Text(
                                                        '${item1.currencySymbol} ${item1.amount}',
                                                        // "${controller.sameDayResponse!.data![index].holidayDay}",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: ColorUtils
                                                              .kGrayMain,
                                                          fontWeight:
                                                              FontWeight.w100,
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
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                );
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
        ));
  }
}
