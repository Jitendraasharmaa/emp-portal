import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/app_constants.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          "Dashboard",
          style: Styles.textStyleMedium().copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: MyColors.whiteColor),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const ImageIcon(
            AssetImage("assets/images/menu.png"),
            size: 20,
            color: MyColors.whiteColor,
          ),
        ),
        backgroundColor: MyColors.mainColor,
        foregroundColor: Colors.black,
        // backwardsCompatibility: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage("assets/images/notify.png"),
              size: 20,
              color: MyColors.whiteColor,
            ),
          ),
        ],
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
                        height: 90,
                        width: width,
                        color: MyColors.mainColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                        child: Column(
                          children: [
                            Container(
                              width: width,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: MyColors.whiteColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: MyColors.whiteColor,
                                        backgroundImage: AssetImage(
                                            "assets/images/Praveen.jpg"),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Praveen Durai",
                                            style: Styles.textStyleLarge(),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Employee Id",
                                        style: Styles.textStyleSmall(
                                                color: MyColors.greyColor1)
                                            .copyWith(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "IB030",
                                        style: Styles.textStyleSmall(
                                                color: MyColors.blackColor)
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Email",
                                        style: Styles.textStyleSmall(
                                                color: MyColors.greyColor1)
                                            .copyWith(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "praveendurai.j@rspinnovations.com",
                                        style: Styles.textStyleSmall(
                                                color: MyColors.blackColor)
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                tabContainer(
                                    image: "assets/images/about_me.png",
                                    text: "About Me",
                                    color: const Color(0xffFBB03C),
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                          context, AppConstants.aboutMePage);
                                    }),
                                const SizedBox(
                                  width: 10,
                                ),
                                tabContainer(
                                    image: "assets/images/personal_info.png",
                                    text: "Personal Info",
                                    color: const Color(0xff6F85C1),
                                    onTap: () async {
                                      await Navigator.pushNamed(context,
                                          AppConstants.personalInfoPage);
                                    }),
                                const SizedBox(
                                  width: 10,
                                ),
                                tabContainer(
                                    image: "assets/images/Change_password.png",
                                    text: "Change Pass",
                                    color: const Color(0xffD792BF),
                                    onTap: () async {
                                      await Navigator.pushNamed(context,
                                          AppConstants.changePasswordPage);
                                    }),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                tabContainer(
                                    image: "assets/images/Device_List.png",
                                    text: "Device List",
                                    color: const Color(0xff7BCBBE),
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                          context, AppConstants.deviceListPage);
                                    }),
                                const SizedBox(
                                  width: 10,
                                ),
                                tabContainer(
                                    image: "assets/images/Holiday_List.png",
                                    text: "Holiday List",
                                    color: const Color(0xffDDE89A),
                                    onTap: () async {
                                      await Navigator.pushNamed(context,
                                          AppConstants.holidayListPage);
                                    }),
                                const SizedBox(
                                  width: 10,
                                ),
                                tabContainer(
                                    image: "assets/images/leaves.png",
                                    text: "Leaves",
                                    color: const Color(0xff81D2E5),
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                          context, AppConstants.leaveListPage);
                                    }),
                              ],
                            )
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

  Widget tabContainer(
      {required String image,
      required String text,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width / 3.5,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyColors.whiteColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color,
              child: Center(
                child: Image.asset(
                  image,
                  height: 35,
                  width: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: Styles.textStyleSmall(color: MyColors.blackColor)
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
