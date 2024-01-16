import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsp_portal/util/textfields_widget.dart';
import 'package:rsp_portal/util/validator.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class AddDevicePage extends StatefulWidget {
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = false;

  TextEditingController deviceName = TextEditingController();
  TextEditingController assignDate = TextEditingController();
  TextEditingController deviceBrand = TextEditingController();
  TextEditingController deviceSerial = TextEditingController();
  TextEditingController ram = TextEditingController();
  TextEditingController storage = TextEditingController();
  TextEditingController comment = TextEditingController();

  List<String> storageTypes = ['SSD', 'HDD'];
  String? storageTypevalue;
  int radioSelected = 1;
  String radioVal = 'Yes';

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
          "Add Device",
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
                          title: "Device Name",
                          isRequired: true,
                          textController: deviceName,
                          inputType: TextInputType.text,
                          validator: Validator.notEmpty,
                        ),
                        hp.textfield(
                            title: "Assign Date",
                            isRequired: true,
                            textController: assignDate,
                            inputType: TextInputType.text,
                            suffixIcon: const Icon(
                              Icons.date_range,
                              color: MyColors.tableBorderColor,
                            )
                            // validator: Validator.notEmpty,
                            ),
                        hp.textfield(
                          title: "Device Brand Name",
                          isRequired: true,
                          textController: deviceBrand,
                          inputType: TextInputType.text,
                          validator: Validator.notEmpty,
                        ),
                        hp.textfield(
                          title: "Device Serial Number",
                          isRequired: false,
                          textController: deviceSerial,
                          inputType: TextInputType.text,
                          validator: Validator.notEmpty,
                        ),
                        hp.textfield(
                          title: "Ram",
                          isRequired: false,
                          textController: ram,
                          inputType: TextInputType.number,
                        ),
                        hp.inputFieldtitle(title: "Storage", isRequired: false),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
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
                                  controller: storage,
                                  read: false,
                                  obscureText: false,
                                  hintText: '',
                                  bordercolor: MyColors.whiteColor,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: hp.dropDown(
                                  dropdownData: storageTypes,
                                  value: storageTypevalue,
                                  hint: "Storage Type",
                                  onChanged: (val) {
                                    setState(() {
                                      storageTypevalue = val.toString();
                                    });
                                  }),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        hp.textfield(
                            title: "Comment",
                            isRequired: false,
                            textController: comment,
                            inputType: TextInputType.text,
                            maxLines: 3
                            // validator: Validator.notEmpty,
                            ),
                        hp.inputFieldtitle(
                            title: "Device Returned", isRequired: true),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: 1,
                              groupValue: radioSelected,
                              activeColor: MyColors.blackColor,
                              onChanged: (value) {
                                setState(() {
                                  radioSelected = 1;
                                  radioVal = 'Yes';
                                });
                              },
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Yes',
                              style: Styles.textStyleMedium(
                                      color: MyColors.greenColor)
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Radio(
                              value: 2,
                              groupValue: radioSelected,
                              activeColor: MyColors.blackColor,
                              onChanged: (value) {
                                setState(() {
                                  radioSelected = 2;
                                  radioVal = 'No';
                                });
                              },
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'No',
                              style: Styles.textStyleMedium(
                                      color: MyColors.redColor)
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
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
