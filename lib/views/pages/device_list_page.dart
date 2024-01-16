import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/app_constants.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class DeviceListPage extends StatefulWidget {
  @override
  _DeviceListPageState createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
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
          "Device List",
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
      floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () async {
            await Navigator.pushNamed(context, AppConstants.addDevicePage);
          },
          tooltip: "Add Device",
          backgroundColor: MyColors.mainColor,
          child: const Icon(
            Icons.add,
            color: MyColors.whiteColor,
          )),
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
                            ListView.builder(
                                primary: true,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                // padding: const EdgeInsets.symmetric(horizontal: 15),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      width: width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 50,
                                                  height: 50,
                                                  // padding: const EdgeInsets.all(5),
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                    ),
                                                    color: Color(0xff82D295),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "${index + 1}",
                                                      style: Styles.textStyleSmall(
                                                              color: MyColors
                                                                  .whiteColor)
                                                          .copyWith(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  )),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Dell Latitude",
                                                    style:
                                                        Styles.textStyleMedium()
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Assigned Date : 22-02-2023",
                                                    style:
                                                        Styles.textStyleMedium(
                                                                color: MyColors
                                                                    .greyColor1)
                                                            .copyWith(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            color: MyColors.hintTextColor,
                                            thickness: 0.4,
                                            height: 0,
                                            indent: 0,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                dataSet(
                                                    tiltle: "Brand",
                                                    data: "Apple"),
                                                dataSet(
                                                    tiltle: "Serial Number",
                                                    data: "Latitude E5570"),
                                                dataSet(
                                                    tiltle: "RAM",
                                                    data: "4 GB"),
                                                dataSet(
                                                    tiltle: "Disk Size",
                                                    data: "500 GB"),
                                                dataSet(
                                                    tiltle: "Returned",
                                                    data: "No",
                                                    color: MyColors.redColor),
                                                dataSet(
                                                    tiltle: "Comments",
                                                    data: "Lorem Ipsum"),
                                              ],
                                            ),
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

  Widget dataSet(
      {required String tiltle,
      required String data,
      Color color = MyColors.greyColor1}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    tiltle,
                    style: Styles.textStyleMedium()
                        .copyWith(fontWeight: FontWeight.w600)
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  ":",
                  style: Styles.textStyleMedium()
                      .copyWith(fontWeight: FontWeight.w600)
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              data,
              style: Styles.textStyleMedium(color: color)
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
