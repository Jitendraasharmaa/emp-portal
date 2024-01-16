import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class ColleaguesDetailsPage extends StatefulWidget {
  @override
  _ColleaguesDetailsPageState createState() => _ColleaguesDetailsPageState();
}

class _ColleaguesDetailsPageState extends State<ColleaguesDetailsPage> {
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
          "Colleagues Details",
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
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/bg.png'),
                            fit: BoxFit.fill,
                          ),
                          color: MyColors.whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: MyColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundColor: MyColors.whiteColor,
                                backgroundImage:
                                    AssetImage("assets/images/Praveen.jpg"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Praveen Durai",
                              style: Styles.textStyleMedium().copyWith(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Flutter Developer",
                              style: Styles.textStyleMedium(
                                      color: MyColors.greyColor1)
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            hp.titleBarWithData(
                                title: "Mobile Number",
                                image:
                                    "assets/images/personal_info_icons/mobile_icon.png",
                                data: "9629850213"),
                            hp.titleBarWithData(
                                title: "Email",
                                image:
                                    "assets/images/personal_info_icons/Mail_icon.png",
                                data: "praveendurai.j@rspinnovations.com"),
                            hp.titleBarWithData(
                                title: "Date of Birth",
                                image:
                                    "assets/images/personal_info_icons/date_icon.png",
                                data: "29-05-1997"),
                            hp.titleBarWithData(
                                title: "Education",
                                image: "assets/images/Education_icon.png",
                                data: "B.Tech (Information Technology)"),
                            hp.titleBarWithData(
                                title: "Skills",
                                image: "assets/images/skills_icon.png",
                                data: "Mobile App Development"),
                            hp.titleBarWithData(
                                title: "Date of Joining",
                                image: "assets/images/doj_icon.png",
                                data: "21-10-2021"),
                            hp.titleBarWithData(
                                title: "Address",
                                image: "assets/images/address_icon.png",
                                data: "Thoothukudi"),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
