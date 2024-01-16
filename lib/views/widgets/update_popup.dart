import 'dart:math';

import 'package:flutter/material.dart';

import '../../util/colors_const.dart';
import '../../util/styles.dart';

class UpdatePopup extends StatefulWidget {
  final VoidCallback no;
  final VoidCallback yes;
  final String title;
  final String description;
  final String btnText1;
  final String btnText2;
  final Color btnColor;
  final double height;

  const UpdatePopup(
      {Key? key,
      required this.no,
      required this.yes,
      this.title = "Update Available",
      this.description = "Please update the application to continue.",
      this.btnText1 = "Exit",
      this.btnText2 = "Update",
      this.btnColor = MyColors.mainColor,
      this.height = 160})
      : super(key: key);
  @override
  UpdatePopupState createState() => UpdatePopupState();
}

class UpdatePopupState extends State<UpdatePopup> {
  MediaQueryData get dimensions => MediaQuery.of(context);
  // Future<SharedPreferences> _sharedPrefs = SharedPreferences.getInstance();
  double get pixelRatio => dimensions.devicePixelRatio;
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(height, 2) + pow(width, 2));
  TextEditingController remarks = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: Container(
            height: widget.height,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyColors.whiteColor,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text(widget.title,
                              style: Styles.textStyleLarge())),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.description,
                        style: Styles.textStyleMedium(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: widget.no,
                          child: Container(
                            width: width,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                ),
                                color: MyColors.whiteColor,
                                border: Border.all(
                                    color: const Color(0xffDBDBDB), width: 1)),
                            child: Center(
                              child: Text(widget.btnText1,
                                  style: Styles.textStyleMedium()),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: widget.yes,
                          child: Container(
                            width: width,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                ),
                                color: widget.btnColor,
                                border: Border.all(
                                    color: MyColors.whiteColor, width: 1)),
                            child: Center(
                              child: Text(widget.btnText2,
                                  style: Styles.textStyleMedium(
                                      color: MyColors.whiteColor)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
