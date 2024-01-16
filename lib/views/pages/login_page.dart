import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/app_constants.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../../util/validator.dart';
import '../widgets/my_button.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String? tokenFCM;
  bool isloading = false;
  bool isvisible = true;
  bool isRemember = false;
  @override
  void initState() {
    super.initState();
    hp = Helper.of(context);
    getdata();
  }

  getdata() async {
    setState(() {
      isloading = true;
    });
    // final sharedPrefs = await SharedPreferences.getInstance();

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: MyColors.mainColor,
          child: isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.hintTextColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 85,
                              width: 85,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Welcome RSP!",
                            // textScaleFactor: 1.0,
                            style: Styles.textStyleMedium(
                                    color: MyColors.whiteColor)
                                .copyWith(fontSize: 30)),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: width,
                          height: height,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60)),
                            color: MyColors.whiteColor,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text("Sign in with RSP Credentials",
                                  // textScaleFactor: 1.0,
                                  style: Styles.textStyleMedium(
                                          color: MyColors.blackColor)
                                      .copyWith(fontSize: 20)),
                              const SizedBox(
                                height: 30,
                              ),
                              hp.textfield(
                                title: "User Name",
                                isRequired: false,
                                textController: username,
                                inputType: TextInputType.text,
                                isreadonly: false,
                                fillColor: MyColors.whiteColor,
                                preffixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: MyColors.hintTextColor,
                                ),
                                hintText: "Enter User Name",
                                borderColor: MyColors.whiteColor,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              hp.inputFieldtitle(
                                  title: "Password", isRequired: false),
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Text("Password",
                              //       // textScaleFactor: 1.0,
                              //       style: Styles.textStyleSmall()),
                              // ),

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  validator: Validator.validatePassword,
                                  controller: password,
                                  obscureText: isvisible,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: MyColors.whiteColor,
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: MyColors.whiteColor, width: 1),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: MyColors.whiteColor, width: 1),
                                    ),
                                    hintText: "Enter Password",
                                    hintStyle: Styles.textStyleSmall(
                                        color: MyColors.hintTextColor),
                                    contentPadding: const EdgeInsets.all(10),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: MyColors.hintTextColor,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isvisible = !isvisible;
                                          });
                                        },
                                        icon: Icon(
                                          !isvisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: !isvisible
                                              ? MyColors.hintTextColor
                                              : MyColors.hintTextColor,
                                          size: 20.0,
                                        )),
                                  ),
                                  style: Styles.textStyleMedium(
                                      color: MyColors.blackColor),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Checkbox(
                                        value: isRemember,
                                        activeColor: MyColors.mainColor,
                                        checkColor: MyColors.whiteColor,
                                        onChanged: (value) {
                                          setState(() {
                                            isRemember = !isRemember;
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("Remember Me",
                                      // textScaleFactor: 1.0,
                                      style: Styles.textStyleSmall()),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: MyButton(
                                  text: "Login".toUpperCase(),
                                  textcolor: MyColors.whiteColor,
                                  textsize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterspacing: 0.7,
                                  buttoncolor: MyColors.buttonColor,
                                  borderColor: MyColors.buttonColor,
                                  buttonheight: 45,
                                  buttonwidth: width,
                                  radius: 30,
                                  onTap: () async {
                                    print("Out");
                                    // if (formKey.currentState!.validate()) {
                                    //   print("in");
                                    //   login();
                                    // }
                                    await Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppConstants.homepage,
                                        Helper.of(context).predicate);
                                  },
                                ),
                              ),
                            ],
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

  login() async {
    Helper.openLoadingDialog(context, "Validating...");
    // final sharedPrefs = await SharedPreferences.getInstance();
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.version;
    // var data = {
    //   "imei": sharedPrefs.getString(AppConstants.IMEI),
    //   "username": username.text,
    //   "password": password.text,
    //   "version_number": version,
    //   "device_name": sharedPrefs.getString(AppConstants.DEVICENAME),
    // };
    // // ignore: use_build_context_synchronously
    // final value = await UserProvider().login(data);
    // LoginModel lm = value;
    // if (lm.status == "pass") {
    //   // ignore: use_build_context_synchronously
    //   SharedPreferences localStorage = await SharedPreferences.getInstance();
    //   localStorage.setString(AppConstants.TOKEN, lm.token);
    //   print("Token : ${lm.token}");
    //   Navigator.of(context, rootNavigator: true).pop();
    //   // await Navigator.pushNamedAndRemoveUntil(
    //   //     context, AppConstants.APPPAGES, Helper.of(context).predicate,
    //   //     arguments: 0);
    //   await Navigator.pushNamedAndRemoveUntil(
    //       context, AppConstants.Homepage, Helper.of(context).predicate);
    // } else {
    //   Dialogs.toast(lm.message, context, isnormal: false, isError: true);
    //   if (!mounted) return;
    //   Navigator.of(context, rootNavigator: true).pop();
    // }
  }
}
