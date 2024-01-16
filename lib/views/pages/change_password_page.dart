import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/views/widgets/my_button.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = false;

  bool isvisible = true;
  bool isvisible1 = true;
  bool isvisible2 = true;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrimPassword = TextEditingController();

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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Change Password",
          style: Styles.textStyleMedium().copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: MyColors.whiteColor),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.whiteColor,
          ),
        ),
        backgroundColor: MyColors.mainColor,
        foregroundColor: Colors.black,
        // backwardsCompatibility: false,
      ),
      resizeToAvoidBottomInset: true,
      drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: MyColors.whiteColor,
          child: isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            hp.textfield(
                              title: "Old Password",
                              isRequired: true,
                              textController: oldPassword,
                              inputType: TextInputType.text,
                              obscureText: isvisible2,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisible2 = !isvisible2;
                                    });
                                  },
                                  icon: Icon(
                                    !isvisible2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: !isvisible2
                                        ? MyColors.blackColor
                                        : MyColors.blackColor,
                                    size: 20.0,
                                  )),
                              // validator: Validator.notEmpty,
                            ),
                            hp.textfield(
                              title: "New Password",
                              isRequired: true,
                              textController: password,
                              inputType: TextInputType.text,
                              obscureText: isvisible,
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
                                        ? MyColors.blackColor
                                        : MyColors.blackColor,
                                    size: 20.0,
                                  )),
                              // validator: Validator.notEmpty,
                            ),
                            hp.textfield(
                              title: "Confirm New Password",
                              isRequired: true,
                              textController: confrimPassword,
                              inputType: TextInputType.text,
                              obscureText: isvisible1,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisible1 = !isvisible1;
                                    });
                                  },
                                  icon: Icon(
                                    !isvisible1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: !isvisible1
                                        ? MyColors.blackColor
                                        : MyColors.blackColor,
                                    size: 20.0,
                                  )),
                              // validator: Validator.notEmpty,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: MyButton(
                          text: "Change Password",
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
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
