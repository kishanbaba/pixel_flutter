import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_create_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_create_response_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_get_country_currency_response_model.dart';
import 'package:pixel_app/Client/ViewModel/client_create_view_model.dart';
import 'package:pixel_app/Client/ViewModel/client_get_country_currency_view_model.dart';
import 'package:pixel_app/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool show = true;
  bool confirmShow = true;
  TextEditingController userName = TextEditingController();
  TextEditingController clientCode = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? selectedCountries;
  String? selectedCurrency;

  int? selectedCountriesId;
  int? selectedCurrencyId;

  ClientGetCountryCurrencyViewModel clientGetCountryCurrencyViewModel =
      Get.put(ClientGetCountryCurrencyViewModel());

  ClientCreateViewModel clientCreateViewModel =
      Get.put(ClientCreateViewModel());

  @override
  void initState() {
    clientGetCountryCurrencyViewModel.clientGetCountryCurrencyViewModel();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      'Create your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<ClientGetCountryCurrencyViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          ClientGetCountryCurrencyResponseModel
                              countryCurrencyResponse =
                              controller.apiResponse.data;

                          return Container(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'User Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: userName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter username';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
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
                                  'Client Code',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: clientCode,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter client code';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'client code',
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
                                  'First Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: firstName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter first name';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'first name',
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
                                  'Last Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: lastName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter last name';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'last name',
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
                                  'Company Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: companyName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter company name';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'company name',
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
                                  'Phone Number',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: phoneNumber,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter phone number';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'phone number',
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
                                  'Currency',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                ///

                                DropdownButtonFormField(
                                  hint: new Text("select currency"),
                                  value: selectedCurrency,
                                  onChanged: (String? newVal) {
                                    setState(() {
                                      print('newVal===> ${newVal}');
                                      selectedCurrencyId = int.parse(newVal!);
                                      print(
                                          'selectedCurrencyId===> ${selectedCurrencyId}');
                                    });
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  items: countryCurrencyResponse
                                      .data!.currencies!
                                      .map((currencyCode) {
                                    return DropdownMenuItem(
                                        value: currencyCode.id.toString(),
                                        child: Text(
                                          '${currencyCode.text}',
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
                                  'Country',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                ///

                                DropdownButtonFormField(
                                  hint: new Text("select country"),
                                  value: selectedCountries,
                                  onChanged: (String? newVal) {
                                    setState(() {
                                      print('newVal===> ${newVal}');
                                      selectedCountriesId = int.parse(newVal!);
                                      print(
                                          'selectedCurrencyId===> ${selectedCurrencyId}');
                                    });
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      )),

                                  items: countryCurrencyResponse
                                      .data!.countries!
                                      .map((countryCode) {
                                    return DropdownMenuItem(
                                        value: countryCode.id.toString(),
                                        child: Text(
                                          '${countryCode.text}',
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
                                  controller: password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
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
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Confirm Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  obscureText: confirmShow,
                                  controller: confirmPassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter Confirm password';
                                    }
                                    if (value != password.text) {
                                      return 'please enter Same password';
                                    } else {
                                      // setState(() {
                                      //   confirm = false;
                                      //   print('FALSE $confirm');
                                      // });
                                      setState(() {});
                                    }
                                    return null;
                                    if (value == null || value.isEmpty) {
                                      return 'please enter Confirm Password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(confirmShow
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        color: Color(0xffA7A7A7),
                                        onPressed: () {
                                          setState(() {
                                            confirmShow = !confirmShow;
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
                                const SizedBox(
                                  height: 20,
                                ),

                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      ClientCreateRequestModel req =
                                          ClientCreateRequestModel();

                                      req.emailId = userName.text;
                                      req.clientCode = clientCode.text;
                                      req.firstNm = firstName.text;
                                      req.lastNm = lastName.text;
                                      req.companyNm = companyName.text;
                                      req.contactNo = phoneNumber.text;
                                      req.currencyId = selectedCurrencyId;
                                      req.countryId = selectedCountriesId;
                                      req.loginPass = password.text;

                                      await clientCreateViewModel
                                          .clientCreateViewModel(req);
                                      if (clientCreateViewModel
                                              .apiResponse.status ==
                                          Status.COMPLETE) {
                                        ClientCreateResponseModel response =
                                            clientCreateViewModel
                                                .apiResponse.data;
                                        if (response.status == 'success') {
                                          Get.back();
                                        } else {
                                          Get.snackbar(
                                              "Error", 'Invalid Data Enter',
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        }
                                      } else {
                                        var response = clientCreateViewModel
                                            .apiResponse.data;
                                        print('response :: ${response}');

                                        Get.snackbar(
                                            "Error", 'Invalid Data Enter',
                                            snackPosition:
                                                SnackPosition.BOTTOM);
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
                                        'Create account',
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
                                  height: 20,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already hve an account?',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        '  Log in',
                                        style: TextStyle(
                                            color: Color(0xff0039FF),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                              height: Get.height * 0.65,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              child:
                                  Center(child: CircularProgressIndicator()));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
