import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/views/widgets/my_button.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = false;

  TextEditingController education = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController empID = TextEditingController();
  TextEditingController workEmail = TextEditingController();

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
          "About Me",
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
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                hp.textfield(
                                  title: "Education",
                                  isRequired: false,
                                  textController: education,
                                  inputType: TextInputType.text,
                                  // validator: Validator.notEmpty,
                                ),
                                hp.textfield(
                                  title: "Skills",
                                  isRequired: false,
                                  textController: skills,
                                  inputType: TextInputType.text,
                                  // validator: Validator.notEmpty,
                                ),
                                hp.textfield(
                                  title: "Employee Id",
                                  isRequired: false,
                                  isreadonly: true,
                                  textController: empID,
                                  inputType: TextInputType.text,
                                  fillColor: MyColors.tableBorderColor,
                                  borderColor: MyColors.tableBorderColor,
                                ),
                                hp.textfield(
                                  title: "Work Email",
                                  isRequired: false,
                                  isreadonly: true,
                                  textController: workEmail,
                                  inputType: TextInputType.emailAddress,
                                  fillColor: MyColors.tableBorderColor,
                                  borderColor: MyColors.tableBorderColor,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: MyButton(
                          text: "Edit",
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
