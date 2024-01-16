import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/app_constants.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class LeaveListPage extends StatefulWidget {
  @override
  _LeaveListPageState createState() => _LeaveListPageState();
}

class _LeaveListPageState extends State<LeaveListPage> {
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
          "Leaves",
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
            await Navigator.pushNamed(context, AppConstants.leaveAddPage);
          },
          tooltip: "Add Leave",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                dataBox(
                                    data: "25",
                                    text: "Total Leaves",
                                    color: const Color(0xffFFC107)),
                                const SizedBox(
                                  width: 12,
                                ),
                                dataBox(
                                    data: "20",
                                    text: "Taken",
                                    color: const Color(0xffDC3545)),
                                const SizedBox(
                                  width: 12,
                                ),
                                dataBox(
                                    data: "5",
                                    text: "Remaining",
                                    color: const Color(0xff28A745)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                dataBox(
                                    data: "25",
                                    text: "Compensatory",
                                    color: const Color(0xff6C757D)),
                                const SizedBox(
                                  width: 12,
                                ),
                                dataBox(
                                    data: "20",
                                    text: "Optional",
                                    color: const Color(0xff007BFF)),
                                const SizedBox(
                                  width: 12,
                                ),
                                dataBox(
                                    data: "5",
                                    text: "LOP",
                                    color: const Color(0xff9E4CFF)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Leaves Request Info",
                              style: Styles.textStyleMedium().copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Table(
                            columnWidths: const {
                              3: FlexColumnWidth(2),
                              0: FlexColumnWidth(1.8)
                            },
                            children: [
                              TableRow(children: [
                                Container(
                                  height: 30,
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  decoration: const BoxDecoration(
                                    color: MyColors.titleContainerColor,
                                    // borderRadius: const BorderRadius.only(
                                    //     topLeft: Radius.circular(15.0)),
                                  ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Date',
                                        style: Styles.textStyleSmall().copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      )),
                                ),
                                Container(
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: MyColors.titleContainerColor,
                                  ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Count',
                                        style: Styles.textStyleSmall().copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      )),
                                ),
                                Container(
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: MyColors.titleContainerColor,
                                  ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Type',
                                        style: Styles.textStyleSmall().copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      )),
                                ),
                                Container(
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: MyColors.titleContainerColor,
                                  ),
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Status',
                                        style: Styles.textStyleSmall().copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      )),
                                ),
                              ]),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                              primary: true,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              // padding: const EdgeInsets.symmetric(horizontal: 15),
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Table(
                                      columnWidths: const {
                                        3: FlexColumnWidth(2),
                                        0: FlexColumnWidth(1.8)
                                      },
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 10),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '01-01-2023',
                                                  style: Styles.textStyleSmall(
                                                          color: MyColors
                                                              .greyColor1)
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13),
                                                )),
                                          ),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '2',
                                                style: Styles.textStyleSmall(
                                                        color:
                                                            MyColors.greyColor1)
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13),
                                              )),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Vacation',
                                                style: Styles.textStyleSmall(
                                                        color:
                                                            MyColors.greyColor1)
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13),
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 70,
                                                  child: Text(
                                                    index % 2 == 0
                                                        ? 'Rejected'
                                                        : "Approved",
                                                    style: Styles.textStyleSmall(
                                                            color: index % 2 ==
                                                                    0
                                                                ? MyColors
                                                                    .redColor1
                                                                : MyColors
                                                                    .greenColor)
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 13),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: MyColors.whiteColor,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    "assets/images/arrow_icon.png",
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(
                                      color: MyColors.greyColor1,
                                      thickness: 0.4,
                                      height: 0,
                                      indent: 0,
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                  ],
                                );
                              }),
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

  Widget dataBox(
      {required String data, required String text, required Color color}) {
    return Expanded(
      child: Container(
          width: 110,
          height: 70,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data,
                style: Styles.textStyleMedium().copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: MyColors.whiteColor),
              ),
              const SizedBox(
                height: 3,
              ),
              Expanded(
                child: Text(
                  text,
                  style: Styles.textStyleMedium().copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: MyColors.whiteColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )),
    );
  }
}
