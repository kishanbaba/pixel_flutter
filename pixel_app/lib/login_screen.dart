import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/login_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/login_response_model.dart';
import 'package:pixel_app/Client/Screens/bottom_bar.dart';
import 'package:pixel_app/Client/Screens/login_screen_main.dart';
import 'package:pixel_app/Employee/screens/employee_login_screen_main.dart';
import 'package:pixel_app/Services/pref_manager.dart';
import 'package:pixel_app/utils/colors.dart';
import 'package:pixel_app/Client/ViewModel/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/svg/login1.svg',
                  height: Get.height * 0.23,
                ),
                SvgPicture.asset(
                  'assets/svg/login2.svg',
                  height: Get.height * 0.23,
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.10,
            ),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              child: Text(
                'Don’t warry we do it',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontSize: 18),
                softWrap: true,
              ),
            ),
            SizedBox(
              height: Get.height * 0.020,
            ),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              child: Text(
                'Your wedding video editing patner',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontSize: 18),
                softWrap: true,
              ),
            ),
            SizedBox(
              height: Get.height * 0.040,
            ),

            GestureDetector(
              onTap: () {
                Get.to(MainLoginScreen());
              },
              child: Container(
                height: Get.height * 0.06,
                width: Get.width * 0.90,
                decoration: const BoxDecoration(
                  color: ColorUtils.kGrayLogin,
                ),
                child: const Center(
                  child: Text(
                    'Client',
                    style: TextStyle(
                        color: ColorUtils.kWhite,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.020,
            ),
            GestureDetector(
              onTap: () {
                Get.to(EmployeeMainLoginScreen());
              },
              child: Container(
                height: Get.height * 0.06,
                width: Get.width * 0.90,
                decoration: const BoxDecoration(
                  color: ColorUtils.kGrayLogin,
                ),
                child: const Center(
                  child: Text(
                    'Employee',
                    style: TextStyle(
                        color: ColorUtils.kWhite,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: Get.height * 0.020,
            // ),
            // GestureDetector(
            //   onTap: () async {
            //     LoginRequestModel req = LoginRequestModel();
            //
            //     req.emailId = 'Mandeep';
            //     req.loginPass = 'Mithil_15';
            //     await _loginViewModel.loginViewModel(req);
            //     if (_loginViewModel.apiResponse.status == Status.LOADING) {
            //       CircularProgressIndicator();
            //     } else if (_loginViewModel.apiResponse.status ==
            //         Status.COMPLETE) {
            //       LoginResponseModel response =
            //           _loginViewModel.apiResponse.data;
            //       if (response.status == 'success') {
            //         Get.offAll(BottomBarScreen());
            //
            //         PreferenceManager.setClientId(
            //             response.data![0].clientId!.toString());
            //         PreferenceManager.setUserType('client');
            //         PreferenceManager.setCompanyName(
            //             response.data![0].companyName!);
            //
            //         PreferenceManager.setEmailId(response.data![0].emailId!);
            //         PreferenceManager.setClientCode(
            //             response.data![0].clientCode!);
            //
            //         print('CLIENT ID :: ${PreferenceManager.getClientId()}');
            //       } else {
            //         Get.snackbar("Error", 'Invalid user name or password',
            //             snackPosition: SnackPosition.BOTTOM);
            //       }
            //     } else {
            //       var response = _loginViewModel.apiResponse.data;
            //       print('response :: ${response}');
            //
            //       Get.snackbar("Error", 'Invalid user name or password',
            //           snackPosition: SnackPosition.BOTTOM);
            //     }
            //   },
            //   child: Container(
            //     height: Get.height * 0.06,
            //     width: Get.width * 0.90,
            //     decoration: const BoxDecoration(
            //       color: ColorUtils.kGrayLogin,
            //     ),
            //     child: const Center(
            //       child: Text(
            //         'Guest Login',
            //         style: TextStyle(
            //             color: ColorUtils.kWhite,
            //             fontSize: 18,
            //             fontFamily: 'Roboto',
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
