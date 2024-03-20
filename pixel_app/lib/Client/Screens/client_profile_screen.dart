import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_app/Client/Api/Api/api_response.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_detail_request_model.dart';
import 'package:pixel_app/Client/Api/Model/RequestModel/client_update_request_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_detail_response_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_get_country_currency_response_model.dart';
import 'package:pixel_app/Client/Api/Model/ResponseModel/client_update_response_model.dart';
import 'package:pixel_app/Client/ViewModel/client_detail_view_model.dart';
import 'package:pixel_app/Client/ViewModel/client_get_country_currency_view_model.dart';
import 'package:pixel_app/Client/ViewModel/client_update_view_model.dart';
import 'package:pixel_app/Services/pref_manager.dart';
import 'package:pixel_app/utils/colors.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  bool show = true;
  bool confirmShow = true;
  TextEditingController userName = TextEditingController();
  TextEditingController clientCode = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController companyName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController state = TextEditingController();

  String? selectedCountries;
  String? selectedCurrency;
  String selectedCountriesHint = '';
  String selectedCurrencyHint = '';

  int? selectedCountriesId;
  int? selectedCurrencyId;

  ClientGetCountryCurrencyViewModel clientGetCountryCurrencyViewModel =
      Get.put(ClientGetCountryCurrencyViewModel());

  ClientDetailViewModel clientDetailViewModel =
      Get.put(ClientDetailViewModel());
  ClientUpdateViewModel clientUpdateViewModel =
      Get.put(ClientUpdateViewModel());

  @override
  void initState() {
    getUserData();
    clientGetCountryCurrencyViewModel.clientGetCountryCurrencyViewModel();

    super.initState();
  }

  getUserData() async {
    ClientDetailRequestModel clientDetailRequestModel =
        ClientDetailRequestModel();
    clientDetailRequestModel.clientId =
        int.parse(PreferenceManager.getClientId());

    await clientDetailViewModel.clientDetailViewModel(clientDetailRequestModel);
    print(
        '--clientDetailViewModel.apiResponse.status--${clientDetailViewModel.apiResponse.status}');
    if (clientDetailViewModel.apiResponse.status == Status.COMPLETE) {
      ClientDetailResponseModel clientDetailResponseModel =
          clientDetailViewModel.apiResponse.data;
      print(
          '--clientDetailResponseModel.data?.emailId--${clientDetailResponseModel.data?.emailId}');
      userName.text = clientDetailResponseModel.data?.emailId ?? '';
      clientCode.text = clientDetailResponseModel.data?.clientCode ?? '';
      firstName.text = clientDetailResponseModel.data?.firstNm ?? '';
      lastName.text = clientDetailResponseModel.data?.lastNm ?? '';
      companyName.text = clientDetailResponseModel.data?.companyNm ?? '';
      phoneNumber.text = clientDetailResponseModel.data?.contactNo ?? '';
      website.text = clientDetailResponseModel.data?.website ?? '';
      address.text = clientDetailResponseModel.data?.clientAddress ?? '';
      city.text = clientDetailResponseModel.data?.cityNm ?? '';
      zipCode.text = clientDetailResponseModel.data?.zipcode ?? '';
      state.text = clientDetailResponseModel.data?.stateNm ?? '';
      // selectedCountries = clientDetailResponseModel.data?.country == null ||
      //         clientDetailResponseModel.data?.country == ''
      //     ? ''
      //     : clientDetailResponseModel.data?.country;
      // selectedCurrency =
      //     clientDetailResponseModel.data?.currency?.currencyNm == null ||
      //             clientDetailResponseModel.data?.currency?.currencyNm == ''
      //         ? ''
      //         : clientDetailResponseModel.data?.currency?.currencyNm ?? '';
      selectedCountriesId = clientDetailResponseModel.data?.countryId;
      selectedCurrencyId = clientDetailResponseModel.data?.currencyId;
    }
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
                      'Profile',
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

                          countryCurrencyResponse.data!.currencies!
                              .forEach((element) {
                            if (element.id == selectedCurrencyId) {
                              selectedCurrencyHint = element.text ?? '';
                            }
                          });

                          countryCurrencyResponse.data!.countries!
                              .forEach((element) {
                            if (element.id == selectedCountriesId) {
                              selectedCountriesHint = element.text ?? "";
                            }
                          });

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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'please select currency';
                                  //   }
                                  //   return null;
                                  // },
                                  hint: selectedCurrencyHint.isNotEmpty
                                      ? Text(
                                          "${selectedCurrencyHint}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Roboto",
                                              fontSize: 13),
                                        )
                                      : Text("select currency"),
                                  // value: selectedCurrency ?? '',
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
                                  'Website',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: website,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'please enter website';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: const InputDecoration(
                                      hintText: 'website',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      )),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      ))),
                                ),

                                ///
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: address,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'please enter address';
                                  //   }
                                  //   return null;
                                  // },
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                      hintText: 'address',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      )),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      ))),
                                ),

                                ///
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'City',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: city,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'please enter city';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: const InputDecoration(
                                      hintText: 'city',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      )),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      ))),
                                ),

                                ///
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Zipcode',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: zipCode,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'please enter zipcode';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: const InputDecoration(
                                      hintText: 'zipcode',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      )),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xffD6D6D6),
                                      ))),
                                ),

                                ///
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'State',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: state,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'please enter state';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: const InputDecoration(
                                      hintText: 'state',
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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'please select country';
                                  //   }
                                  //   return null;
                                  // },
                                  hint: selectedCountriesHint.isNotEmpty
                                      ? Text(
                                          "${selectedCountriesHint}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Roboto",
                                              fontSize: 13),
                                        )
                                      : Text("select country"),

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
                                  height: 20,
                                ),

                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      ClientUpdateRequestModel req =
                                          ClientUpdateRequestModel();
                                      req.clientId = int.parse(
                                          PreferenceManager.getClientId());
                                      ;
                                      req.emailId = userName.text;
                                      req.clientCode = clientCode.text;
                                      req.firstNm = firstName.text;
                                      req.lastNm = lastName.text;
                                      req.companyNm = companyName.text;
                                      req.contactNo = phoneNumber.text;
                                      req.currencyId = selectedCurrencyId;
                                      req.countryId = selectedCountriesId;

                                      await clientUpdateViewModel
                                          .clientUpdateViewModel(req);
                                      if (clientUpdateViewModel
                                              .apiResponse.status ==
                                          Status.COMPLETE) {
                                        ClientUpdateResponseModel response =
                                            clientUpdateViewModel
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
                                        var response = clientUpdateViewModel
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
                                        'Update Profile',
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
