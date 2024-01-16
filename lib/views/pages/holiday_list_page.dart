import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class HolidayListPage extends StatefulWidget {
  @override
  _HolidayListPageState createState() => _HolidayListPageState();
}

class _HolidayListPageState extends State<HolidayListPage> {
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
          "Holiday List",
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Please note that you have to opt for any 2 optional leaves. Request you to block your optional leaves by informing us at the earliest as to which optional leave you are opting for. Mail the same to me and management.",
                              style: Styles.textStyleMedium().copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Table(
                            columnWidths: const {1: FlexColumnWidth(1.5)},
                            children: [
                              TableRow(children: [
                                Container(
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: MyColors.titleContainerColor,
                                    // borderRadius: const BorderRadius.only(
                                    //     topLeft: Radius.circular(15.0)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'No',
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
                                  child: Center(
                                      child: Text(
                                    'Name',
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
                                  child: Center(
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
                                  child: Center(
                                      child: Text(
                                    'Optional',
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
                                        1: FlexColumnWidth(1.5)
                                      },
                                      children: [
                                        TableRow(children: [
                                          Center(
                                              child: Text(
                                            '${index + 1}',
                                            style: Styles.textStyleSmall(
                                                    color: MyColors.greyColor1)
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                          )),
                                          Center(
                                              child: Text(
                                            'New Year 2023',
                                            style: Styles.textStyleMedium(
                                                    color: MyColors.textColor)
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13),
                                          )),
                                          Center(
                                              child: Text(
                                            '01-01-2023',
                                            style: Styles.textStyleSmall(
                                                    color: MyColors.greyColor1)
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13),
                                          )),
                                          Center(
                                              child: Text(
                                            index % 2 == 0 ? 'No' : "Yes",
                                            style: Styles.textStyleSmall(
                                                    color: index % 2 == 0
                                                        ? MyColors.redColor1
                                                        : MyColors.greenColor)
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13),
                                          )),
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
}
