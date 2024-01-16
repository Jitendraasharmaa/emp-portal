import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/validator.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class PersonalInfoEditPage extends StatefulWidget {
  @override
  _PersonalInfoEditPageState createState() => _PersonalInfoEditPageState();
}

class _PersonalInfoEditPageState extends State<PersonalInfoEditPage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController personalEmail = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController emergencyContact = TextEditingController();
  TextEditingController permanentAddress = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController aadharNum = TextEditingController();

  List<String> titles = ['Mr', 'Mrs', 'Miss'];
  String? titlevalue;
  List<String> permanentStates = ['Tamil Nadu', 'Karnataka', 'Kerala'];
  String? permanentStatevalue;
  List<String> permanentCities = ['Thoothukudi', 'OOty', 'Kodaikanal'];
  String? permanentCityvalue;
  List<String> currentStates = ['Tamil Nadu', 'Karnataka', 'Kerala'];
  String? currentStatevalue;
  List<String> currentCities = ['Thoothukudi', 'OOty', 'Kodaikanal'];
  String? currentCityvalue;
  List<String> bloodGroups = ['B +ve', 'A +ve', 'O +ve'];
  String? bloodGroupvalue;

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
          "Personal Info",
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
                        Container(
                          // padding: const EdgeInsets.all(20),
                          height: 120,
                          width: 120,
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
                          child: Stack(
                            children: [
                              const Center(
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: MyColors.whiteColor,
                                  backgroundImage:
                                      AssetImage("assets/images/Praveen.jpg"),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(10)),
                                    color: MyColors.greyColor,
                                  ),
                                  child: Image.asset(
                                    "assets/images/edit_icon.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        hp.inputFieldtitle(title: "Title", isRequired: true),
                        hp.dropDown(
                            dropdownData: titles,
                            value: titlevalue,
                            onChanged: (val) {
                              setState(() {
                                titlevalue = val.toString();
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.textfield(
                          title: "First Name",
                          isRequired: true,
                          textController: firstName,
                          inputType: TextInputType.text,
                          validator: Validator.notEmpty,
                        ),
                        hp.textfield(
                          title: "Last Name",
                          isRequired: true,
                          textController: lastName,
                          inputType: TextInputType.text,
                          validator: Validator.notEmpty,
                        ),
                        hp.textfield(
                          title: "Nick Name",
                          isRequired: false,
                          textController: nickName,
                          inputType: TextInputType.text,
                          validator: Validator.notEmpty,
                        ),
                        hp.textfield(
                            title: "Date of birth",
                            isRequired: true,
                            textController: dob,
                            inputType: TextInputType.text,
                            suffixIcon: const Icon(
                              Icons.date_range,
                              color: MyColors.tableBorderColor,
                            )
                            // validator: Validator.notEmpty,
                            ),
                        hp.textfield(
                          title: "Personal Email",
                          isRequired: true,
                          textController: personalEmail,
                          inputType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                        ),
                        hp.textfield(
                          title: "Mobile",
                          isRequired: true,
                          textController: mobile,
                          inputType: TextInputType.number,
                          validator: Validator.validateMobile,
                        ),
                        hp.textfield(
                          title: "Emergency Contact Number",
                          isRequired: false,
                          textController: emergencyContact,
                          inputType: TextInputType.number,
                          // validator: Validator.notEmpty,
                        ),
                        hp.textfield(
                          title: "Permanent Address",
                          isRequired: false,
                          textController: permanentAddress,
                          inputType: TextInputType.text,
                          // validator: Validator.notEmpty,
                        ),
                        hp.inputFieldtitle(
                            title: "Permanent State", isRequired: false),
                        hp.dropDown(
                            dropdownData: permanentStates,
                            value: permanentStatevalue,
                            onChanged: (val) {
                              setState(() {
                                permanentStatevalue = val.toString();
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.inputFieldtitle(
                            title: "Permanent City", isRequired: false),
                        hp.dropDown(
                            dropdownData: permanentCities,
                            value: permanentCityvalue,
                            onChanged: (val) {
                              setState(() {
                                permanentCityvalue = val.toString();
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.textfield(
                          title: "Current Address",
                          isRequired: false,
                          textController: currentAddress,
                          inputType: TextInputType.text,
                          // validator: Validator.notEmpty,
                        ),
                        hp.inputFieldtitle(
                            title: "Current State", isRequired: false),
                        hp.dropDown(
                            dropdownData: currentStates,
                            value: currentStatevalue,
                            onChanged: (val) {
                              setState(() {
                                currentStatevalue = val.toString();
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.inputFieldtitle(
                            title: "Current City", isRequired: false),
                        hp.dropDown(
                            dropdownData: currentCities,
                            value: currentCityvalue,
                            onChanged: (val) {
                              setState(() {
                                currentCityvalue = val.toString();
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.textfield(
                          title: "Aadhar Number",
                          isRequired: false,
                          textController: aadharNum,
                          inputType: TextInputType.number,
                          // validator: Validator.notEmpty,
                        ),
                        hp.inputFieldtitle(
                            title: "Blood Group", isRequired: false),
                        hp.dropDown(
                            dropdownData: bloodGroups,
                            value: bloodGroupvalue,
                            onChanged: (val) {
                              setState(() {
                                bloodGroupvalue = val.toString();
                              });
                            }),
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
