import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/app_constants.dart';
import 'package:rsp_portal/views/widgets/my_button.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = false;
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
          "Personal Info",
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
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: MyColors.whiteColor,
                        backgroundImage:
                            AssetImage("assets/images/Praveen.jpg"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      hp.titleBarWithData(
                          title: "Title",
                          image:
                              "assets/images/personal_info_icons/title_icon.png",
                          data: "Mr "),
                      hp.titleBarWithData(
                          title: "Full Name",
                          image:
                              "assets/images/personal_info_icons/name_icon.png",
                          data: "Praveen Durai"),
                      hp.titleBarWithData(
                          title: "Nickname",
                          image:
                              "assets/images/personal_info_icons/nickName_icon.png",
                          data: "Durai"),
                      hp.titleBarWithData(
                          title: "Date of Birth",
                          image:
                              "assets/images/personal_info_icons/date_icon.png",
                          data: "29-05-1997"),
                      hp.titleBarWithData(
                          title: "Personal Email",
                          image:
                              "assets/images/personal_info_icons/Mail_icon.png",
                          data: "jjpraveendurai@gmail.com"),
                      hp.titleBarWithData(
                          title: "Mobile Number",
                          image:
                              "assets/images/personal_info_icons/mobile_icon.png",
                          data: "9629850213"),
                      hp.titleBarWithData(
                          title: "Emergency Contact Number",
                          image:
                              "assets/images/personal_info_icons/call_icon.png",
                          data: "9629850213"),
                      hp.titleBarWithData(
                          title: "Permanent Address",
                          image:
                              "assets/images/personal_info_icons/address_icon.png",
                          data: "Rajapalayam, Thoothukudi"),
                      hp.titleBarWithData(
                          title: "Permanent State",
                          image:
                              "assets/images/personal_info_icons/State_icon.png",
                          data: "Tamil Nadu"),
                      hp.titleBarWithData(
                          title: "Permanent City",
                          image:
                              "assets/images/personal_info_icons/City_icon.png",
                          data: "Thoothukudi"),
                      hp.titleBarWithData(
                          title: "Current Address",
                          image:
                              "assets/images/personal_info_icons/address_icon.png",
                          data: "Rajapalayam, Thoothukudi"),
                      hp.titleBarWithData(
                          title: "Current State",
                          image:
                              "assets/images/personal_info_icons/State_icon.png",
                          data: "Tamil Nadu"),
                      hp.titleBarWithData(
                          title: "Current City",
                          image:
                              "assets/images/personal_info_icons/City_icon.png",
                          data: "Thoothukudi"),
                      hp.titleBarWithData(
                          title: "Adhar Number",
                          image:
                              "assets/images/personal_info_icons/aadhar_icon.png",
                          data: "0000 0000 0000"),
                      hp.titleBarWithData(
                          title: "Blood Group",
                          image:
                              "assets/images/personal_info_icons/Blood_Group_icon.png",
                          data: "B +ve"),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            await Navigator.pushNamed(
                                context, AppConstants.personalInfoEditPage);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
