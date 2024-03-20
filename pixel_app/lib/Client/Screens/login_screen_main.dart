import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/login_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/login_response_model.dart';
import 'package:pixel_app/Client/Screens/bottom_bar.dart';
import 'package:pixel_app/Client/Screens/register_screen.dart';
import 'package:pixel_app/Client/ViewModel/login_view_model.dart';
import 'package:pixel_app/Services/Notification.dart';
import 'package:pixel_app/Services/pref_manager.dart';

import 'package:pixel_app/utils/colors.dart';

class MainLoginScreen extends StatefulWidget {
  const MainLoginScreen({Key? key}) : super(key: key);

  @override
  _MainLoginScreenState createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  bool _value = false;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 30,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg/login3.svg',
                  height: Get.height * 0.35,
                ),
                const Text(
                  'Welcome to \nPixel films editng\nYour wedding video editing patner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // const Text(
                //   'Login to your account',
                //   style: TextStyle(
                //       fontFamily: 'Roboto',
                //       fontSize: 22,
                //       fontWeight: FontWeight.w600),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter UsrName';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xffA7A7A7),
                            ),
                            hintText: 'username',
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
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: show,
                        controller: _password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xffA7A7A7),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(show
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: Color(0xffA7A7A7),
                              onPressed: () {
                                setState(() {
                                  show = !show;
                                });
                              },
                            ),
                            hintText: '**********',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xffD6D6D6),
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xffD6D6D6),
                            ))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 50,
                        width: 150,
                        child: Row(
                          children: [
                            Checkbox(
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value!;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff525252)),
                            )
                          ],
                        )),
                    const Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xff0039FF)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                     final fcmToken  = MessagingService.fcmToken;
                      debugPrint("loginscreen = $fcmToken");
                      LoginRequestModel req = LoginRequestModel();

                      req.emailId = _username.text;
                      req.loginPass = _password.text;
                      req.fcm = fcmToken;
                     debugPrint("req---------------= $req");

                     await _loginViewModel.loginViewModel(req);
                      if (_loginViewModel.apiResponse.status ==
                          Status.COMPLETE) {
                        LoginResponseModel response =
                            _loginViewModel.apiResponse.data;
                        if (response.status == 'success') {
                          Get.offAll(BottomBarScreen());

                          PreferenceManager.setClientId(
                              response.data![0].clientId!.toString());
                          PreferenceManager.setUserType('client');
                          PreferenceManager.setCompanyName(
                              response.data![0].companyName!);

                          PreferenceManager.setEmailId(
                              response.data![0].emailId!);
                          PreferenceManager.setClientCode(
                              response.data![0].clientCode!);

                          print(
                              'CLIENT ID :: ${PreferenceManager.getClientId()}');
                        } else {
                          Get.snackbar("Error", 'Invalid user name or password',
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      } else {
                        var response = _loginViewModel.apiResponse.data;
                        print('response :: ${response}');

                        Get.snackbar("Error", 'Invalid user name or password',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    }
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
                        'Login',
                        style: TextStyle(
                            color: ColorUtils.kWhite,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        ' Register',
                        style: TextStyle(
                            color: Color(0xff0039FF),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
