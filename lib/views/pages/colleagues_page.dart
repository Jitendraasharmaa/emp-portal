import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/app_constants.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class ColleaguesPage extends StatefulWidget {
  @override
  _ColleaguesPageState createState() => _ColleaguesPageState();
}

class _ColleaguesPageState extends State<ColleaguesPage> {
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
          "Colleagues",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                            GridView.builder(
                                itemCount: 9,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 120,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 15,
                                        childAspectRatio:
                                            //  width > 450
                                            //     ? 0.65
                                            //     : width > 400
                                            //         ? 0.73
                                            //         : width > 340
                                            //             ? 0.46
                                            //             : 0.4,
                                            2,
                                        //  width > 400
                                        //     ? 1.02
                                        //     : width > 340
                                        //         ? 0.7
                                        //         : 0.67,
                                        crossAxisCount: 3),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      await Navigator.pushNamed(context,
                                          AppConstants.colleaguesDetailsPage);
                                    },
                                    child: Container(
                                      width: width / 3.3,
                                      // height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
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
                                          Container(
                                            width: width / 3.3,
                                            height: 80,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8)),
                                              color: MyColors.blackColor,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8)),
                                              child: Image.asset(
                                                "assets/images/Praveen.jpg",
                                                width: width / 3.3,
                                                height: 80,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "Praveen Durai",
                                            style: Styles.textStyleMedium()
                                                .copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: MyColors.blackColor),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
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
