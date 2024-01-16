import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class LeaveAddPage extends StatefulWidget {
  @override
  _LeaveAddPageState createState() => _LeaveAddPageState();
}

class _LeaveAddPageState extends State<LeaveAddPage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = false;

  TextEditingController leaveDate = TextEditingController();
  TextEditingController leaveReason = TextEditingController();

  List<String> leaveType = ['Sick', 'Vacation', 'Optional'];
  String? leaveTypevalue;
  List<String> leaveDuration = ['Full Day', 'Half Day'];
  String? leaveDurationvalue;

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
          "Leave Add",
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        hp.textfield(
                            title: "Leave Date",
                            isRequired: true,
                            textController: leaveDate,
                            inputType: TextInputType.text,
                            suffixIcon: const Icon(
                              Icons.date_range,
                              color: MyColors.hintTextColor,
                            )
                            // validator: Validator.notEmpty,
                            ),
                        hp.inputFieldtitle(
                            title: "Leave Type", isRequired: true),
                        hp.dropDown(
                            dropdownData: leaveType,
                            value: leaveTypevalue,
                            onChanged: (val) {
                              setState(() {
                                leaveTypevalue = val.toString();
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.inputFieldtitle(
                            title: "Leave Duration", isRequired: true),
                        hp.dropDown(
                            dropdownData: leaveDuration,
                            value: leaveDurationvalue,
                            onChanged: (val) {
                              setState(() {
                                leaveDurationvalue = val.toString();
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.textfield(
                            title: "Leave Reason",
                            isRequired: true,
                            textController: leaveReason,
                            inputType: TextInputType.text,
                            maxLines: 3),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: MyColors.buttonColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.save,
                                        color: MyColors.whiteColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "SAVE",
                                        style: Styles.textStyleMedium(
                                                color: MyColors.whiteColor)
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: MyColors.redColor1,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.close,
                                        color: MyColors.whiteColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "CANCEL",
                                        style: Styles.textStyleMedium(
                                                color: MyColors.whiteColor)
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
