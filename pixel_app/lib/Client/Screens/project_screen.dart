import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/project_client_notes_request_model.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/project_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/finished_project_response_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/project_client_notes_response_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/project_response_model.dart';
import 'package:pixel_app/Client/ViewModel/project_client_notes_view_model.dart';
import 'package:pixel_app/Client/ViewModel/project_view_model.dart';
import 'package:pixel_app/Services/pref_manager.dart';
import 'package:pixel_app/utils/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with SingleTickerProviderStateMixin {
  ProjectViewModel projectViewModel = Get.put(ProjectViewModel());
  ProjectClientNotesViewModel projectClientNotesViewModel =
      Get.put(ProjectClientNotesViewModel());
  TextEditingController clientNote = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final _formKey = GlobalKey<FormState>();
  TabController? _tabController;
  int pageSize = 25;
  int finishedProjectPageSize = 25;
  int recordsTotalFinishProject = 0;
  int recordsTotalPendingProject = 0;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);

    _tabController?.addListener(() {
      getProjectData();
      print("Selected Index:  ${_tabController!.index}");
    });
    getProjectData();
    super.initState();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    int totalRecord = _tabController!.index == 0 ? recordsTotalPendingProject : recordsTotalFinishProject;
    int projectDataLength =
        _tabController!.index == 0 ? projectViewModel
            .pendingProjectApiResponse.data.data!.recordsTotal ?? "" :
        projectViewModel
        .finishedProjectApiResponse.data.data!.recordsTotal ?? "";
    if(totalRecord != projectDataLength) {
      await Future.delayed(Duration(milliseconds: 1000));
      pageSize = pageSize + 25;
      finishedProjectPageSize = finishedProjectPageSize + 25;
      print('--pageSize--${pageSize}');

      await getProjectData();

      if (mounted) setState(() {});
      _refreshController.loadComplete();

      print("Footer status --->${_refreshController.footerStatus}");
    }else{
      _refreshController.loadNoData();
    }
  }

  Future<void> getProjectData() async {
    ProjectRequestModel req = ProjectRequestModel();

    // {
    //   "ClientId":4,
    // "Search": "",
    // "Project_Status": "PENDING",
    // "OrderBy": "Asc",
    // "StartRecord": 0,
    // "PageSize": 25
    // }

    req.clientId = int.parse(PreferenceManager.getClientId());
    req.search = searchController.text;
    req.projectStatus = _tabController!.index;
    req.orderBy = 'Asc';
    req.startRecord = 0;
    req.pageSize = _tabController!.index == 0 ? pageSize : finishedProjectPageSize;

    print('--pageSize--${pageSize}');
    print('--finishedProjectPageSize--${finishedProjectPageSize}');
    // req.emailId = _email.text;
    // req.loginPass = _password.text;

    if (_tabController!.index == 0) {
      await projectViewModel.pendingProjectViewModel(req);
    } else if (_tabController!.index == 1) {
      await projectViewModel.finishedProjectViewModel(req);
    }

    // if (projectViewModel.apiResponse.status ==
    //     Status.COMPLETE) {
    //   ProjectResponseModel response =
    //       _loginViewModel.apiResponse.data;
    //   if (response.status == 'success') {
    //     Get.snackbar("Success", 'Login Successful',
    //         snackPosition: SnackPosition.BOTTOM);
    //     // Get.to(BottomBarScreen());
    //   } else {
    //     Get.snackbar("Error", '${response.message} ',
    //         snackPosition: SnackPosition.BOTTOM);
    //   }
    // } else {
    //   Get.snackbar(
    //       "Error", '${_loginViewModel.apiResponse.message} ',
    //       snackPosition: SnackPosition.BOTTOM);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.kGrayMain,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: InkWell(
        onTap: () {
          ///BOTTOM SHEET
          Get.bottomSheet(Container(
            height: 200,
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: searchController,
                  // validator:
                  //     (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter Notes';
                  //   }
                  //   return null;
                  // },
                  // minLines:
                  // 3,
                  // expands:
                  //     true,
                  // maxLines: null,

                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search....',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffD6D6D6),
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffD6D6D6),
                      ))),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    getProjectData();
                    Get.back();
                  },
                  child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 48,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: ColorUtils.kGrayLogin,
                    ),
                    child: const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: ColorUtils.kWhite,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));

          ///DIALOG BOX

          // Get.dialog(
          //     AlertDialog(
          //       title: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Search',
          //             style: TextStyle(
          //               fontFamily: 'Roboto',
          //               fontSize: 20,
          //               fontWeight: FontWeight.w400,
          //               color: ColorUtils.kGrayLogin,
          //             ),
          //           ),
          //           InkWell(
          //               onTap: () {
          //                 Get.back();
          //                 searchController.clear();
          //               },
          //               child: Icon(Icons.close))
          //         ],
          //       ),
          //       content: Container(
          //         // height: 100,
          //         child: Column(mainAxisSize: MainAxisSize.min, children: [
          //           TextFormField(
          //             controller: searchController,
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
          //           SizedBox(height: 10),
          //           InkWell(
          //             onTap: () async {
          //               getProjectData(
          //                   index: _tabController!.index,
          //                   search: searchController.text);
          //               Get.back();
          //             },
          //             child: Container(
          //               height: Get.height * 0.06,
          //               width: Get.width * 0.90,
          //               decoration: const BoxDecoration(
          //                 color: ColorUtils.kGrayLogin,
          //               ),
          //               child: const Center(
          //                 child: Text(
          //                   'Submit',
          //                   style: TextStyle(
          //                     color: ColorUtils.kWhite,
          //                     fontSize: 18,
          //                     fontFamily: 'Roboto',
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           )
          //         ]),
          //       ),
          //     ),
          //     barrierDismissible: false,
          //     barrierColor: Colors.black87.withOpacity(0.8));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 75),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFF455A64),
            child: SvgPicture.asset('assets/svg/filter.svg',
                height: 45, width: 45),
          ),
        ),
      ),
      body: Container(
        // height: Get.height,
        // width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        margin: EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            Container(
              height: 47,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20))),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
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
                onTap: (int index) {
                  print('indeex :: $index');
                  getProjectData();
                },
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
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: [
                  GetBuilder<ProjectViewModel>(builder: (controller) {
                    if (projectViewModel.pendingProjectApiResponse.status ==
                        Status.COMPLETE) {
                      PendingProjectResponseModel responseModel =
                          projectViewModel.pendingProjectApiResponse.data;
                      pageSize = responseModel.data!.recordsFiltered!;
                      recordsTotalPendingProject = responseModel.data!.recordsTotal!;
                      return responseModel.data!.recordsFiltered == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: SvgPicture.asset(
                                  'assets/svg/no_data_found.svg'),
                            )
                          : SmartRefresher(
                              enablePullDown: false,
                              enablePullUp: true,
                              physics: BouncingScrollPhysics(),
                              onLoading: _onLoading,
                              onRefresh: _onRefresh,
                              // header: WaterDropHeader(),
                              footer: CustomFooter(
                                builder:
                                    (BuildContext context, LoadStatus? mode) {
                                  Widget body;
                                  if (mode == LoadStatus.idle) {
                                    body = SizedBox();
                                  } else if (mode == LoadStatus.loading) {
                                    body = CircularProgressIndicator();
                                  } else if (mode == LoadStatus.failed) {
                                    body = Text("Load Failed!Click retry!");
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = SizedBox();
                                  } else {
                                    body = Text("No more Data");
                                  }
                                  return Center(child: body);
                                },
                              ),
                              controller: _refreshController,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                // height: 200,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      // SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Total Project : ${responseModel.data?.recordsFiltered ?? ''}',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF455A64),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        itemCount:
                                            responseModel.data?.data?.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var item =
                                              responseModel.data?.data?[index];

                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 20,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${item?.projectNm ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${item?.currencySymbol ?? ''}${item?.price ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/svg/calender.svg'),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          'Delivery Date :',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xFF455A65),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          // '05/07/2022',
                                                          '${item?.deliveryDt?.day ?? ''}/${item?.deliveryDt?.month ?? ''}/${item?.deliveryDt?.year ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xFF455A64),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  ListView.builder(
                                                    itemCount: item
                                                        ?.projectEvents?.length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      var eventData =
                                                          item?.projectEvents?[
                                                              index];

                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5,
                                                                vertical: 3),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          height: 43,
                                                          width: Get.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            // mainAxisAlignment:
                                                            //     MainAxisAlignment
                                                            //         .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    Get.width *
                                                                        0.4,
                                                                child: Text(
                                                                  '${eventData?.eventName ?? ''}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xFF000000),
                                                                  ),
                                                                ),
                                                              ),
                                                              // Spacer(),
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
                                                                              .withOpacity(0.8)
                                                                          : '${eventData?.eventStatus ?? ''}' == 'FINALIZED'
                                                                              ? Color(0xFF1AD94D).withOpacity(0.8)
                                                                              : '${eventData?.eventStatus ?? ''}' == 'PENDING'
                                                                                  ? Color(0xFFFEC81F)
                                                                                  : Color(0xFF009BFF).withOpacity(0.8)),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text(
                                                                    '${eventData?.eventStatus ?? ''}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Color(
                                                                          0xFF444444),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Spacer(),

                                                              // SizedBox(width: 30),
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Text(
                                                                  '${item?.currencySymbol ?? ''}${eventData?.price ?? ''}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xFF000000),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  // SizedBox(height: 5),
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.symmetric(
                                                  //           horizontal: 5),
                                                  //   child: Container(
                                                  //     padding: EdgeInsets.symmetric(
                                                  //         horizontal: 10),
                                                  //     height: 43,
                                                  //     width: Get.width,
                                                  //     decoration: BoxDecoration(
                                                  //       color: Color(0xFFFFFFFF),
                                                  //       border: Border.all(
                                                  //         color: Color(0xFF000000),
                                                  //       ),
                                                  //     ),
                                                  //     child: Row(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .spaceBetween,
                                                  //       children: [
                                                  //         Container(
                                                  //           width: Get.width * 0.45,
                                                  //           child: Text(
                                                  //             'Wedding',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         // Spacer(),
                                                  //         Row(
                                                  //           children: [
                                                  //             CircleAvatar(
                                                  //                 radius: 6,
                                                  //                 backgroundColor:
                                                  //                     Color(0xFF1AD94D)
                                                  //                         .withOpacity(
                                                  //                             0.8)),
                                                  //             SizedBox(width: 5),
                                                  //             Text(
                                                  //               'Finalized',
                                                  //               style: TextStyle(
                                                  //                 fontFamily:
                                                  //                     'Roboto',
                                                  //                 fontSize: 14,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w400,
                                                  //                 color: Color(
                                                  //                     0xFF444444),
                                                  //               ),
                                                  //             )
                                                  //           ],
                                                  //         ),
                                                  //         SizedBox(width: 30),
                                                  //         Align(
                                                  //           alignment: Alignment
                                                  //               .centerRight,
                                                  //           child: Text(
                                                  //             '\$50',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // SizedBox(height: 5),
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.symmetric(
                                                  //           horizontal: 5),
                                                  //   child: Container(
                                                  //     padding: EdgeInsets.symmetric(
                                                  //         horizontal: 10),
                                                  //     height: 43,
                                                  //     width: Get.width,
                                                  //     decoration: BoxDecoration(
                                                  //       color: Color(0xFFFFFFFF),
                                                  //       border: Border.all(
                                                  //         color: Color(0xFF000000),
                                                  //       ),
                                                  //     ),
                                                  //     child: Row(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .spaceBetween,
                                                  //       children: [
                                                  //         Container(
                                                  //           width: Get.width * 0.45,
                                                  //           child: Text(
                                                  //             'Reception',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         // Spacer(),
                                                  //         Row(
                                                  //           children: [
                                                  //             CircleAvatar(
                                                  //                 radius: 6,
                                                  //                 backgroundColor:
                                                  //                     Color(0xFFFEC81F)
                                                  //                         .withOpacity(
                                                  //                             0.8)),
                                                  //             SizedBox(width: 5),
                                                  //             Text(
                                                  //               'Pending',
                                                  //               style: TextStyle(
                                                  //                 fontFamily:
                                                  //                     'Roboto',
                                                  //                 fontSize: 14,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w400,
                                                  //                 color: Color(
                                                  //                     0xFF444444),
                                                  //               ),
                                                  //             )
                                                  //           ],
                                                  //         ),
                                                  //         SizedBox(width: 30),
                                                  //         Align(
                                                  //           alignment: Alignment
                                                  //               .centerRight,
                                                  //           child: Text(
                                                  //             '\$40',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  SizedBox(height: 15),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Visibility(
                                                        visible:
                                                            item?.isEventSong ??
                                                                false,
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/svg/right.svg'),
                                                            SizedBox(width: 15),
                                                            Text(
                                                              'Event song',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xFF000000),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      Visibility(
                                                        // visible: true,
                                                        visible:
                                                            item?.isHilightSong ??
                                                                false,
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/svg/right.svg'),
                                                            SizedBox(width: 15),
                                                            Text(
                                                              'Highlight song',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xFF000000),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 10),
                                                          child: Text(
                                                            'Note:',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          '${item?.note}',
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Divider(
                                                      color: Color(0xFF000000),
                                                      height: 1,
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Text(
                                                            'Client Note:',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            '${item?.clientNote}',
                                                            softWrap: true,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            clientNote.text =
                                                                item?.clientNote ??
                                                                    '';

                                                            print(
                                                                'PROJECT ID :: ${item?.projectId}');

                                                            Get.dialog(
                                                                AlertDialog(
                                                                  title: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Client Note',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color:
                                                                              ColorUtils.kGrayLogin,
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Get.back();
                                                                            clientNote.clear();
                                                                          },
                                                                          child:
                                                                              Icon(Icons.close))
                                                                    ],
                                                                  ),
                                                                  content: Form(
                                                                    key:
                                                                        _formKey,
                                                                    child:
                                                                        Container(
                                                                      // height: 100,
                                                                      child: Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            TextFormField(
                                                                              controller: clientNote,
                                                                              validator: (value) {
                                                                                if (value == null || value.isEmpty) {
                                                                                  return 'Please Enter Notes';
                                                                                }
                                                                                return null;
                                                                              },
                                                                              minLines: 3,
                                                                              // expands:
                                                                              //     true,
                                                                              maxLines: null,
                                                                              decoration: InputDecoration(
                                                                                  hintText: 'Enter notes here',
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
                                                                                  ProjectClientNotesRequestModel req = ProjectClientNotesRequestModel();

                                                                                  // req.emailId = _email.text;
                                                                                  // req.loginPass = _password.text;

                                                                                  req.projectId = item?.projectId;
                                                                                  req.clientNote = clientNote.text;

                                                                                  await projectClientNotesViewModel.projectClientNotesViewModel(req);
                                                                                  if (projectClientNotesViewModel.apiResponse.status == Status.COMPLETE) {
                                                                                    ProjectClientNotesResponseModel response = projectClientNotesViewModel.apiResponse.data;
                                                                                    if (response.status == 'success') {
                                                                                      print('SUCCESS ');
                                                                                      getProjectData();
                                                                                      Get.back();
                                                                                      Get.snackbar("Success", 'Notes update Successful', snackPosition: SnackPosition.BOTTOM);
                                                                                    } else {
                                                                                      Get.snackbar("Error", '${response.message} ', snackPosition: SnackPosition.BOTTOM);
                                                                                    }
                                                                                  } else {
                                                                                    Get.snackbar("Error", '${projectClientNotesViewModel.apiResponse.message} ', snackPosition: SnackPosition.BOTTOM);
                                                                                  }

                                                                                  // Get.back();
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
                                                                                    'Submit',
                                                                                    style: TextStyle(
                                                                                      color: ColorUtils.kWhite,
                                                                                      fontSize: 18,
                                                                                      fontFamily: 'Roboto',
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                ),
                                                                barrierDismissible:
                                                                    false,
                                                                barrierColor: Colors
                                                                    .black87
                                                                    .withOpacity(
                                                                        0.8));
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/svg/note.svg',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Divider(
                                                      color: Color(0xFF000000),
                                                      height: 1,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Due : ${item?.currencySymbol ?? ''} ${item?.dueAmt ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xFF455A64),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Paid : ${item?.currencySymbol ?? ''} ${item?.paidAmt ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xFF455A64),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 48,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF455A64),
                                                            ),
                                                            child: Text(
                                                              'Pending',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Container()),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                    } else {
                      return Container(
                          height: double.infinity,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }),
                  GetBuilder<ProjectViewModel>(builder: (controller) {
                    if (projectViewModel.finishedProjectApiResponse.status ==
                        Status.COMPLETE) {
                      FinishedProjectResponseModel finishedResponseModel1 =
                          projectViewModel.finishedProjectApiResponse.data;
                      finishedProjectPageSize = finishedResponseModel1.data!.recordsFiltered!;
                      recordsTotalFinishProject = finishedResponseModel1.data!.recordsTotal!;
                      return finishedResponseModel1.data!.recordsFiltered == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: SvgPicture.asset(
                                  'assets/svg/no_data_found.svg'),
                            )
                          : SmartRefresher(
                              enablePullDown: false,
                              enablePullUp: true,
                              physics: BouncingScrollPhysics(),
                              onLoading: _onLoading,
                              onRefresh: _onRefresh,
                              // header: WaterDropHeader(),
                              footer: CustomFooter(
                                builder:
                                    (BuildContext context, LoadStatus? mode) {
                                  Widget body;
                                  if (mode == LoadStatus.idle) {
                                    body = SizedBox();
                                  } else if (mode == LoadStatus.loading) {
                                    body = CircularProgressIndicator();
                                  } else if (mode == LoadStatus.failed) {
                                    body = Text("Load Failed!Click retry!");
                                  } else if (mode == LoadStatus.canLoading) {
                                    body = SizedBox();
                                  } else {
                                    body = Text("No more Data");
                                  }
                                  return Center(child: body);
                                },
                              ),
                              controller: _refreshController,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                // height: 200,
                                // color: Colors.red,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Total Project : ${finishedResponseModel1.data?.recordsFiltered ?? ''}',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF455A64),
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        itemCount: finishedResponseModel1
                                            .data?.data?.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var item = finishedResponseModel1
                                              .data?.data?[index];
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 20,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${item?.projectNm ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${item?.currencySymbol ?? ''}${item?.price ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/svg/calender.svg'),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          'Delivery Date :',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xFF455A65),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          // '05/07/2022',
                                                          '${item?.deliveryDt?.day ?? ''}/${item?.deliveryDt?.month ?? ''}/${item?.deliveryDt?.year ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xFF455A64),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  ListView.builder(
                                                    itemCount: item
                                                        ?.projectEvents?.length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      var eventData =
                                                          item?.projectEvents?[
                                                              index];

                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5,
                                                                vertical: 3),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          height: 43,
                                                          width: Get.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            // mainAxisAlignment:
                                                            //     MainAxisAlignment
                                                            //         .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    Get.width *
                                                                        0.4,
                                                                child: Text(
                                                                  '${eventData?.eventName ?? ''}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xFF000000),
                                                                  ),
                                                                ),
                                                              ),
                                                              // Spacer(),
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
                                                                              .withOpacity(0.8)
                                                                          : '${eventData?.eventStatus ?? ''}' == 'FINALIZED'
                                                                              ? Color(0xFF1AD94D).withOpacity(0.8)
                                                                              : '${eventData?.eventStatus ?? ''}' == 'PENDING'
                                                                                  ? Color(0xFFFEC81F)
                                                                                  : Color(0xFF009BFF).withOpacity(0.8)),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text(
                                                                    '${eventData?.eventStatus ?? ''}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Color(
                                                                          0xFF444444),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Spacer(),

                                                              // SizedBox(width: 30),
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Text(
                                                                  '${item?.currencySymbol ?? ''}${eventData?.price ?? ''}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xFF000000),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  // SizedBox(height: 5),
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.symmetric(
                                                  //           horizontal: 5),
                                                  //   child: Container(
                                                  //     padding: EdgeInsets.symmetric(
                                                  //         horizontal: 10),
                                                  //     height: 43,
                                                  //     width: Get.width,
                                                  //     decoration: BoxDecoration(
                                                  //       color: Color(0xFFFFFFFF),
                                                  //       border: Border.all(
                                                  //         color: Color(0xFF000000),
                                                  //       ),
                                                  //     ),
                                                  //     child: Row(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .spaceBetween,
                                                  //       children: [
                                                  //         Container(
                                                  //           width: Get.width * 0.45,
                                                  //           child: Text(
                                                  //             'Wedding',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         // Spacer(),
                                                  //         Row(
                                                  //           children: [
                                                  //             CircleAvatar(
                                                  //                 radius: 6,
                                                  //                 backgroundColor:
                                                  //                     Color(0xFF1AD94D)
                                                  //                         .withOpacity(
                                                  //                             0.8)),
                                                  //             SizedBox(width: 5),
                                                  //             Text(
                                                  //               'Finalized',
                                                  //               style: TextStyle(
                                                  //                 fontFamily:
                                                  //                     'Roboto',
                                                  //                 fontSize: 14,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w400,
                                                  //                 color: Color(
                                                  //                     0xFF444444),
                                                  //               ),
                                                  //             )
                                                  //           ],
                                                  //         ),
                                                  //         SizedBox(width: 30),
                                                  //         Align(
                                                  //           alignment: Alignment
                                                  //               .centerRight,
                                                  //           child: Text(
                                                  //             '\$50',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // SizedBox(height: 5),
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.symmetric(
                                                  //           horizontal: 5),
                                                  //   child: Container(
                                                  //     padding: EdgeInsets.symmetric(
                                                  //         horizontal: 10),
                                                  //     height: 43,
                                                  //     width: Get.width,
                                                  //     decoration: BoxDecoration(
                                                  //       color: Color(0xFFFFFFFF),
                                                  //       border: Border.all(
                                                  //         color: Color(0xFF000000),
                                                  //       ),
                                                  //     ),
                                                  //     child: Row(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .spaceBetween,
                                                  //       children: [
                                                  //         Container(
                                                  //           width: Get.width * 0.45,
                                                  //           child: Text(
                                                  //             'Reception',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         // Spacer(),
                                                  //         Row(
                                                  //           children: [
                                                  //             CircleAvatar(
                                                  //                 radius: 6,
                                                  //                 backgroundColor:
                                                  //                     Color(0xFFFEC81F)
                                                  //                         .withOpacity(
                                                  //                             0.8)),
                                                  //             SizedBox(width: 5),
                                                  //             Text(
                                                  //               'Pending',
                                                  //               style: TextStyle(
                                                  //                 fontFamily:
                                                  //                     'Roboto',
                                                  //                 fontSize: 14,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .w400,
                                                  //                 color: Color(
                                                  //                     0xFF444444),
                                                  //               ),
                                                  //             )
                                                  //           ],
                                                  //         ),
                                                  //         SizedBox(width: 30),
                                                  //         Align(
                                                  //           alignment: Alignment
                                                  //               .centerRight,
                                                  //           child: Text(
                                                  //             '\$40',
                                                  //             style: TextStyle(
                                                  //               fontFamily:
                                                  //                   'Roboto',
                                                  //               fontSize: 18,
                                                  //               fontWeight:
                                                  //                   FontWeight.w600,
                                                  //               color: Color(
                                                  //                   0xFF000000),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  SizedBox(height: 15),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Visibility(
                                                        visible:
                                                            item?.isEventSong ??
                                                                false,
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/svg/right.svg'),
                                                            SizedBox(width: 15),
                                                            Text(
                                                              'Event song',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xFF000000),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      Visibility(
                                                        // visible: true,
                                                        visible:
                                                            item?.isHilightSong ??
                                                                false,
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/svg/right.svg'),
                                                            SizedBox(width: 15),
                                                            Text(
                                                              'Highlight song',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xFF000000),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 10),
                                                          child: Text(
                                                            'Note:',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          '${item?.note}',
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Divider(
                                                      color: Color(0xFF000000),
                                                      height: 1,
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Text(
                                                            'Client Note:',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            '${item?.clientNote}',
                                                            softWrap: true,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xFF000000),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            clientNote.text =
                                                                item?.clientNote ??
                                                                    '';

                                                            print(
                                                                'PROJECT ID :: ${item?.projectId}');

                                                            Get.dialog(
                                                                AlertDialog(
                                                                  title: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Client Note',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color:
                                                                              ColorUtils.kGrayLogin,
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Get.back();
                                                                            clientNote.clear();
                                                                          },
                                                                          child:
                                                                              Icon(Icons.close))
                                                                    ],
                                                                  ),
                                                                  content: Form(
                                                                    key:
                                                                        _formKey,
                                                                    child:
                                                                        Container(
                                                                      // height: 100,
                                                                      child: Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            TextFormField(
                                                                              controller: clientNote,
                                                                              validator: (value) {
                                                                                if (value == null || value.isEmpty) {
                                                                                  return 'Please Enter Notes';
                                                                                }
                                                                                return null;
                                                                              },
                                                                              // expands:
                                                                              //     true,
                                                                              maxLines: null,
                                                                              decoration: InputDecoration(
                                                                                  hintText: 'Enter notes here',
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
                                                                                  ProjectClientNotesRequestModel req = ProjectClientNotesRequestModel();

                                                                                  // req.emailId = _email.text;
                                                                                  // req.loginPass = _password.text;

                                                                                  req.projectId = item?.projectId;
                                                                                  req.clientNote = clientNote.text;

                                                                                  await projectClientNotesViewModel.projectClientNotesViewModel(req);
                                                                                  if (projectClientNotesViewModel.apiResponse.status == Status.COMPLETE) {
                                                                                    ProjectClientNotesResponseModel response = projectClientNotesViewModel.apiResponse.data;
                                                                                    if (response.status == 'success') {
                                                                                      print('SUCCESS ');
                                                                                      getProjectData();
                                                                                      Get.back();
                                                                                      Get.snackbar("Success", 'Notes update Successful', snackPosition: SnackPosition.BOTTOM);
                                                                                    } else {
                                                                                      Get.snackbar("Error", '${response.message} ', snackPosition: SnackPosition.BOTTOM);
                                                                                    }
                                                                                  } else {
                                                                                    Get.snackbar("Error", '${projectClientNotesViewModel.apiResponse.message} ', snackPosition: SnackPosition.BOTTOM);
                                                                                  }

                                                                                  // Get.back();
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
                                                                                    'Submit',
                                                                                    style: TextStyle(
                                                                                      color: ColorUtils.kWhite,
                                                                                      fontSize: 18,
                                                                                      fontFamily: 'Roboto',
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                ),
                                                                barrierDismissible:
                                                                    false,
                                                                barrierColor: Colors
                                                                    .black87
                                                                    .withOpacity(
                                                                        0.8));
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/svg/note.svg',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Divider(
                                                      color: Color(0xFF000000),
                                                      height: 1,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Due : ${item?.currencySymbol ?? ''} ${item?.dueAmt ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xFF455A64),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Paid : ${item?.currencySymbol ?? ''} ${item?.paidAmt ?? ''}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xFF455A64),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 48,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF455A64),
                                                            ),
                                                            child: Text(
                                                              'Finished',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Expanded(
                                                          child: Container(
                                                            height: 48,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 1,
                                                                      color: Color(
                                                                          0xFF455A64),
                                                                    )),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  'assets/svg/right.svg',
                                                                ),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  'Upload Done',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xFF455A64),
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
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                    } else {
                      return Container(
                          height: double.infinity,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
