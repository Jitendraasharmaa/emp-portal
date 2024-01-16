import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/helper.dart';
import '../../util/colors_const.dart';
import '../../util/styles.dart';
import '../widgets/drawer.dart';

class ReimbursementFormPage extends StatefulWidget {
  @override
  _ReimbursementFormPageState createState() => _ReimbursementFormPageState();
}

class _ReimbursementFormPageState extends State<ReimbursementFormPage> {
  late Helper hp;
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = false;

  TextEditingController purpose = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController uploadData = TextEditingController();

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
          "Reimbursement Form",
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
                          title: "Purpose",
                          isRequired: true,
                          textController: purpose,
                          inputType: TextInputType.text,
                        ),
                        hp.textfield(
                          title: "Category",
                          isRequired: true,
                          textController: category,
                          inputType: TextInputType.text,
                        ),
                        hp.textfield(
                          title: "Amount",
                          isRequired: true,
                          textController: amount,
                          inputType: TextInputType.text,
                        ),
                        hp.textfield(
                            title: "Date",
                            isRequired: true,
                            textController: date,
                            inputType: TextInputType.text,
                            suffixIcon: const Icon(
                              Icons.date_range,
                              color: MyColors.hintTextColor,
                            )
                            // validator: Validator.notEmpty,
                            ),
                        hp.textfield(
                            title: "Comment",
                            isRequired: false,
                            textController: comment,
                            inputType: TextInputType.text,
                            maxLines: 3),
                        hp.textfield(
                            title: "Upload",
                            isRequired: true,
                            textController: uploadData,
                            inputType: TextInputType.text,
                            suffixIcon: const Icon(
                              Icons.cloud_upload_outlined,
                              color: MyColors.hintTextColor,
                            )
                            // validator: Validator.notEmpty,
                            ),
                        const SizedBox(
                          height: 30,
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
