import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leave_add_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_leaves_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leave_add_response_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_leaves_master_response_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_leave_add_veiwModel.dart';
import 'package:pixel_app/Employee/ViewModel/employee_leaves_master_view_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_leaves_view_model.dart';

import 'package:pixel_app/utils/colors.dart';

class EmployeeLeaveAddScreen extends StatefulWidget {
  const EmployeeLeaveAddScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeLeaveAddScreen> createState() => _EmployeeLeaveAddScreenState();
}

class _EmployeeLeaveAddScreenState extends State<EmployeeLeaveAddScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  TextEditingController leaveNote = TextEditingController();
  TextEditingController leaveDate = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  EmployeeLeavesMasterViewModel employeeLeavesMasterViewModel =
      Get.put(EmployeeLeavesMasterViewModel());

  EmployeeLeaveAddViewModel employeeLeaveAddViewModel =
      Get.put(EmployeeLeaveAddViewModel());
  EmployeeLeavesViewModel employeeLeavesViewModel =
      Get.put(EmployeeLeavesViewModel());

  String? selectedLeaveTypeName;
  int? selectedLeaveTypeId;
  String? selectedDurationName;
  int? selectedDurationId;
  DateTime selectedDate = DateTime.now();
  String? selectedDateString;

  @override
  void initState() {
    employeeLeavesMasterViewModel.employeeLeavesMasterViewModel();
    // getLeavesData();
    super.initState();
  }

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

  // Future<void> getLeavesData() async {
  //   EmployeeLeavesRequestModel employeeLeavesRequestModel =
  //       EmployeeLeavesRequestModel();
  //
  //   employeeLeavesRequestModel.search = '';
  //   employeeLeavesRequestModel.projectStatus = 0;
  //   employeeLeavesRequestModel.orderBy = 'Asc';
  //   employeeLeavesRequestModel.startRecord = 0;
  //   employeeLeavesRequestModel.pageSize = 25;
  //
  //   await employeeLeavesViewModel
  //       .employeeLeavesViewModel(employeeLeavesRequestModel);
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
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
                    Icons.arrow_back_outlined,
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
      ),
      backgroundColor: ColorUtils.kGrayMain,
      body: Form(
        key: _formKey,
        child: Container(
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
                Text('Add Leave',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.kGrayMain)),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<EmployeeLeavesMasterViewModel>(
                  builder: (controller) {
                    if (controller.apiResponse.status == Status.COMPLETE) {
                      EmployeeLeavesMasterResponseModel response =
                          controller.apiResponse.data;
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Leave note :',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: leaveNote,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter address';
                                }
                                return null;
                              },
                              maxLines: 3,
                              decoration: const InputDecoration(
                                  hintText: 'note :',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffD6D6D6),
                                  )),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffD6D6D6),
                                  ))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Leave date :',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: leaveDate,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please select date';
                                }
                                return null;
                              },
                              readOnly: true,
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100));

                                // print(
                                //     'picked:: --${DateTime(picked!.year, picked.month, picked.day, DateTime.now().hour, DateTime.now().minute, DateTime.now().second)}');

                                if (picked != null && picked != selectedDate) {
                                  setState(() {
                                    print(
                                        'SELECTED DATE 1 :: --${selectedDate}');
                                    print('picked:: --${picked}');
                                    selectedDate = picked;

                                    selectedDateString =
                                        formatISOTime(date: picked);

                                    print(
                                        'SELECTED DATE 1 :: --${selectedDate}');

                                    print(
                                        'selectedDateString DATE 1 :: --${selectedDateString}');
                                    leaveDate.text =
                                        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                  hintText: 'select leave date',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffD6D6D6),
                                  )),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffD6D6D6),
                                  ))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Leave type :',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'please select country';
                                }
                                return null;
                              },
                              hint: Text("select leave type"),

                              value: selectedLeaveTypeName,
                              onChanged: (String? newVal) {
                                setState(() {
                                  print('newVal===> ${newVal}');
                                  selectedLeaveTypeId = int.parse(newVal!);
                                  print(
                                      'selectedLeaveTypeId===> ${selectedLeaveTypeId}');
                                });
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  )),

                              items: response.data!.leaveType!.map((leaveType) {
                                return DropdownMenuItem(
                                    value: leaveType.leaveTypeId.toString(),
                                    child: Text(
                                      '${leaveType.leaveTypeNm}',
                                      style: const TextStyle(
                                          // color: kGrey4,
                                          fontFamily: "Roboto",
                                          fontSize: 13),
                                    ));
                              }).toList(),
                              // items: List.generate(
                              //     _currencies.length,
                              //     (index) => DropdownMenuItem<String>(
                              //           child: new Text(
                              //               '${_currencies[index]['text']}'),
                              //         )).toList(),
                              // items: _currencies.map((Map<String, dynamic> aaa) {
                              //   return new DropdownMenuItem<String>(
                              //     child: new Text('aa'),
                              //   );
                              // }).toList(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Duration :',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'please select duration';
                                }
                                return null;
                              },
                              hint: Text("select duration"),

                              value: selectedDurationName,
                              onChanged: (String? newVal) {
                                setState(() {
                                  print('newVal===> ${newVal}');
                                  selectedDurationId = int.parse(newVal!);
                                  print(
                                      'selectedDurationId===> ${selectedDurationId}');
                                });
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  )),

                              items: response.data!.duration!.map((leaveType) {
                                return DropdownMenuItem(
                                    value: leaveType.durationId.toString(),
                                    child: Text(
                                      '${leaveType.durationNm}',
                                      style: const TextStyle(
                                          // color: kGrey4,
                                          fontFamily: "Roboto",
                                          fontSize: 13),
                                    ));
                              }).toList(),
                              // items: List.generate(
                              //     _currencies.length,
                              //     (index) => DropdownMenuItem<String>(
                              //           child: new Text(
                              //               '${_currencies[index]['text']}'),
                              //         )).toList(),
                              // items: _currencies.map((Map<String, dynamic> aaa) {
                              //   return new DropdownMenuItem<String>(
                              //     child: new Text('aa'),
                              //   );
                              // }).toList(),
                            ),
                          ],
                        ),
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
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      EmployeeLeaveAddRequestModel leaveAddReq =
                          EmployeeLeaveAddRequestModel();
                      leaveAddReq.leaveNm = leaveNote.text.trim();
                      leaveAddReq.leaveTypeId = selectedLeaveTypeId;
                      leaveAddReq.leaveDt = selectedDateString;
                      leaveAddReq.durationId = selectedDurationId;

                      await employeeLeaveAddViewModel
                          .employeeLeaveAddViewModel(leaveAddReq);
                      if (employeeLeaveAddViewModel.apiResponse.status ==
                          Status.COMPLETE) {
                        EmployeeLeaveAddResponseModel response =
                            employeeLeaveAddViewModel.apiResponse.data;
                        if (response.status == 'success') {
                          Get.back();
                          EmployeeLeavesRequestModel
                              employeeLeavesRequestModel =
                              EmployeeLeavesRequestModel();

                          employeeLeavesRequestModel.search = '';
                          employeeLeavesRequestModel.projectStatus = 0;
                          employeeLeavesRequestModel.orderBy = 'Asc';
                          employeeLeavesRequestModel.startRecord = 0;
                          employeeLeavesRequestModel.pageSize = 25;

                          await employeeLeavesViewModel.employeeLeavesViewModel(
                              employeeLeavesRequestModel);
                        } else {
                          Get.snackbar("Error", 'Invalid Data Enter',
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      } else {
                        var response =
                            employeeLeaveAddViewModel.apiResponse.data;
                        print('response :: ${response}');

                        Get.snackbar("Error", 'Invalid Data Enter',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 48,
                    width: Get.width,
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
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
