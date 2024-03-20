import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Employee/Api/Api/api_response.dart';
import 'package:pixel_app/Employee/Api/Model/RequestModel/employee_change_password_request_model.dart';
import 'package:pixel_app/Employee/Api/Model/ResponseModel/employee_change_password_respose_model.dart';
import 'package:pixel_app/Employee/ViewModel/employee_change_password_view_model.dart';
import 'package:pixel_app/utils/colors.dart';

class EmployeeChangePasswordScreen extends StatefulWidget {
  const EmployeeChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _EmployeeChangePasswordScreenState createState() =>
      _EmployeeChangePasswordScreenState();
}

class _EmployeeChangePasswordScreenState
    extends State<EmployeeChangePasswordScreen> {
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String newPassword = '';
  String confirmPassword = '';
  bool show = true;
  bool current = false;
  bool newPass = false;
  bool confirm = false;
  EmployeeChangePasswordViewModel employeeChangePasswordViewModel =
      Get.put(EmployeeChangePasswordViewModel());
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
            ],
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Change Your Password',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF455A64),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Current Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: current == true ? 60 : 40,
                    child: TextFormField(
                      controller: _currentPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            current = true;
                          });
                          return 'Please Enter Current Password';
                        } else {
                          setState(() {
                            current = false;
                            print('FALSE $current');
                          });
                          setState(() {});
                        }
                        return null;
                      },
                      // autovalidateMode: AutovalidateMode.onUserInteraction,

                      onChanged: (value) {
                        // setState(() {
                        //   current = false;
                        // });
                      },

                      decoration: const InputDecoration(

                          // prefixIcon: Icon(
                          //   Icons.email,
                          //   color: Color(0xffA7A7A7),
                          // ),
                          // hintText: '------',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffD6D6D6),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffD6D6D6),
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'New Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: newPass == true ? 60 : 40,
                    child: TextFormField(
                      controller: _newPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            newPass = true;
                          });
                          return 'Please Enter New Password';
                        } else {
                          setState(() {
                            newPass = false;
                            print('FALSE $newPass');
                          });
                          setState(() {});
                        }
                        return null;
                      },
                      onChanged: (value) {
                        value = newPassword;
                      },
                      decoration: const InputDecoration(
                          // prefixIcon: Icon(
                          //   Icons.email,
                          //   color: Color(0xffA7A7A7),
                          // ),
                          // hintText: '------',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffD6D6D6),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffD6D6D6),
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: confirm == true ? 60 : 40,
                    child: TextFormField(
                      controller: _confirmPassword,
                      validator: (value) {
                        setState(() {
                          confirm = true;
                        });
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Confirm Password';
                        }
                        if (value != _newPassword.text) {
                          return 'Please Enter Same Password';
                        } else {
                          setState(() {
                            confirm = false;
                            print('FALSE $confirm');
                          });
                          setState(() {});
                        }
                        return null;
                      },
                      obscureText: show,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                                show ? Icons.visibility_off : Icons.visibility),
                            color: Color(0xffA7A7A7),
                            onPressed: () {
                              setState(() {
                                show = !show;
                              });
                            },
                          ),
                          // hintText: '**********',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffD6D6D6),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffD6D6D6),
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // current = false;
                        // newPass = false;
                        // confirm = false;

                        EmployeeChangePasswordRequestModel req =
                            EmployeeChangePasswordRequestModel();
                        req.currentPassword = _currentPassword.text;
                        req.newPassword = _newPassword.text;
                        await employeeChangePasswordViewModel
                            .employeeClientChangePasswordViewModel(req);
                        print('REQUEST==$req');
                        print(
                            'STATUS==${employeeChangePasswordViewModel.apiResponse.status}');

                        if (employeeChangePasswordViewModel
                                .apiResponse.status ==
                            Status.COMPLETE) {
                          print('DONE');
                          EmployeeChangePasswordResponseModel response =
                              employeeChangePasswordViewModel.apiResponse.data;

                          Get.back();
                        } else if (employeeChangePasswordViewModel
                                .apiResponse.status ==
                            Status.ERROR) {
                          print('NOTDONE');

                          Get.snackbar("Password", 'Something WRONG',
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }
                    },
                    child: Container(
                      height: Get.height * 0.06,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: ColorUtils.kGrayLogin,
                      ),
                      child: const Center(
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: ColorUtils.kWhite,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
