import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rsp_portal/util/styles.dart';

import '../util/colors_const.dart';
import '../util/textfields_widget.dart';

class Helper {
  late BuildContext context;
  late DateTime currentBackPressTime;
  Helper.of(BuildContext context) {
    this.context = context;
  }
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void goBack(dynamic result) {
    Navigator.pop(context, result);
  }

  bool predicate(Route<dynamic> route) {
    print(route);
    return false;
  }

  Widget loader() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
        backgroundColor: Colors.grey[300],
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static void openLoadingDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: <Widget>[
            const SizedBox(
                width: 40,
                height: 40,
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 25,
                )),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: Styles.textStyleMedium(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget titleBar(String text, {double height = 25}) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      color: MyColors.titleContainerColor,
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: Styles.textStyleSmall().copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget titleBar1(String text, {double height = 30}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: height,
          color: MyColors.mainColor,
        ),
        Expanded(
          child: Container(
            height: height,
            color: MyColors.secondaryColor,
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: Styles.textStyleMedium(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget titleBarWithButton(String text, VoidCallback onTap,
      {double height = 30}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: height,
          color: MyColors.mainColor,
        ),
        Expanded(
          child: Container(
            height: height,
            color: MyColors.secondaryColor,
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: Styles.textStyleMedium(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: onTap,
                      icon: const Icon(
                        Icons.add,
                        color: MyColors.blackColor,
                        size: 20,
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget titleBarWithData({
    required String title,
    required String image,
    required String data,
  }) {
    return Column(
      children: [
        titleBar(title),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 25,
            ),
            Image.asset(
              image,
              height: 23,
              width: 23,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              data,
              style: Styles.textStyleMedium()
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget inputFieldtitle({
    required String title,
    required bool isRequired,
    double titleFontSize = 13,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Styles.textStyleMedium().copyWith(fontSize: titleFontSize),
            ),
            !isRequired
                ? const SizedBox()
                : Text(
                    "*",
                    style: Styles.textStyleMedium(color: MyColors.redColor),
                  ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget textfield({
    required String title,
    required bool isRequired,
    required TextEditingController textController,
    required TextInputType inputType,
    double titleFontSize = 13,
    String? Function(String?)? validator,
    bool isreadonly = false,
    bool obscureText = false,
    Color fillColor = MyColors.whiteColor,
    Color borderColor = MyColors.whiteColor,
    Icon? preffixIcon,
    Widget? suffixIcon,
    int maxLines = 1,
    String hintText = "",
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Styles.textStyleMedium().copyWith(fontSize: titleFontSize),
            ),
            !isRequired
                ? const SizedBox()
                : Text(
                    "*",
                    style: Styles.textStyleMedium(color: MyColors.redColor),
                  ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
              ),
            ],
          ),
          child: CustomTextFormField2(
            controller: textController,
            read: isreadonly,
            obscureText: obscureText,
            hintText: hintText,
            validator: validator,
            keyboardType: inputType,
            bordercolor: borderColor,
            fillColor: fillColor,
            preffixIcon: preffixIcon,
            suffixIcon: suffixIcon,
            maxlines: maxLines,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget dropDown(
      {required List<String> dropdownData,
      required String? value,
      String hint = "",
      required void Function(String?)? onChanged}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
            ),
          ],
          border: Border.all(color: MyColors.whiteColor),
          color: MyColors.whiteColor),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 30,
        ),
        style: const TextStyle(
            // fontFamily: 'Fingbanger',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        dropdownColor: const Color(0xffFFFFFF),
        hint: Text(hint, style: Styles.textStyleMedium()),
        value: value,
        onChanged: onChanged,
        items: dropdownData.map((data) {
          return DropdownMenuItem(
            child: Text(data.toString()),
            value: data,
          );
        }).toList(),
      ),
    );
  }

  static void setPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void setAllOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
