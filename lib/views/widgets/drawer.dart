import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rsp_portal/util/app_constants.dart';
import 'package:rsp_portal/util/colors_const.dart';
import 'package:rsp_portal/util/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/login_page.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(height, 2) + pow(width, 2));
  String version = '';
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Drawer(
            backgroundColor: MyColors.bgColor,
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: MyColors.whiteColor,
                        backgroundImage:
                            AssetImage("assets/images/Praveen.jpg"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: MyColors.blackColor,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/projects_icon.png",
                  text: "All Projects",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.allProjectsPage);
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/colleagues_icon.png",
                  text: "Colleagues",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.colleaguesPage);
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/Help_icon.png",
                  text: "Help",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/Reimbursement_icon.png",
                  text: "Reimbursement",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(
                        context, AppConstants.reimbursementPage);
                  },
                ),
                const Divider(
                  color: MyColors.blackColor,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/About_Me_icon.png",
                  text: "About Me",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.aboutMePage);
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/Personal_Info_icon.png",
                  text: "Personal Info",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.personalInfoPage);
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/Change_Password_icon.png",
                  text: "Change Password",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(
                        context, AppConstants.changePasswordPage);
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/Device_List_icon.png",
                  text: "Device List",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.deviceListPage);
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/Holiday_List_icon.png",
                  text: "Holiday List",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.holidayListPage);
                  },
                ),
                Customdrawer(
                  image: "assets/images/drawer_icons/leaves_icon.png",
                  text: "Leaves",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppConstants.leaveListPage);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: GestureDetector(
                    onTap: () {
                      logout();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffE6E6E6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/drawer_icons/logout_icon.png",
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Logout",
                            style: Styles.textStyleSmall(
                                    color: const Color(0xff1A1A1A))
                                .copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: MyColors.blackColor,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0, 100, 5),
              child: Text(
                "App Version : $version",
                style: Styles.textStyleSmall()
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logout() async {
    SharedPreferences localData = await SharedPreferences.getInstance();
    localData.clear();
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext ctx) => Loginpage()));
  }
}

class Customdrawer extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  Customdrawer(
      {Key? key, required this.image, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
        child: Column(
          children: [
            InkWell(
              hoverColor: MyColors.bgColor,
              splashColor: MyColors.bgColor,
              onTap: onTap,
              child: Container(
                width: double.infinity,
                height: 25,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: Styles.textStyleSmall(
                              color: const Color(0xff1A1A1A))
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // const Divider(
            //   color: Color(0xffE0E0E0),
            //   thickness: 0.6,
            // ),
          ],
        ));
  }
}
