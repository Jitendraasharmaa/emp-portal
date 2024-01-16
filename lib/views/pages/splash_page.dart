import 'dart:async';
import 'dart:io';
import 'dart:io' show Platform;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:rsp_portal/helpers/helper.dart';
import 'package:rsp_portal/models/app_update_model.dart';
import 'package:rsp_portal/provider/user_provider.dart';
import 'package:rsp_portal/util/app_constants.dart';
import 'package:rsp_portal/util/colors_const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../widgets/update_popup.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<Splash> {
  MediaQueryData get dimensions => MediaQuery.of(context);
  Size get size => dimensions.size;
  double get height => size.height;
  double get width => size.width;
  double get radius => sqrt(pow(width, 2) + pow(height, 2));
  late Helper hp;
  late AppUpdateModel appUpdateModel;
  @override
  void initState() {
    super.initState();
    hp = Helper.of(context);

    Timer(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString(AppConstants.token);
      // navigate(token);
      getImei(token);
    });
  }

  getImei(token) async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      String imeiNo = androidInfo.id;
      String deviceName = androidInfo.product;
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(AppConstants.imei, imeiNo);
      localStorage.setString(AppConstants.deviceName, deviceName);
    } else if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      String imeiNo = iosInfo.identifierForVendor!;
      String deviceName = iosInfo.name;
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(AppConstants.imei, imeiNo);
      localStorage.setString(AppConstants.deviceName, deviceName);
    }
    final userProvider =
        // ignore: use_build_context_synchronously
        Provider.of<UserProvider>(context, listen: false);
    if (Platform.isAndroid) {
      // PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // String version = packageInfo.version;
      // appUpdateModel = await userProvider.checkUpdate(version);
      // if (appUpdateModel.isForceUpdate == '1') {
      //   // ignore: use_build_context_synchronously
      //   showDialog(
      //     context: context,
      //     barrierDismissible: true,
      //     builder: (context) => UpdatePopup(
      //       no: () async {
      //         exit(0);
      //       },
      //       yes: () async {
      //         launch(appUpdateModel.driveLink);
      //       },
      //     ),
      //   );
      // } else {
      //   navigate(token);
      // }
      navigate(token);
    } else {
      navigate(token);
    }
  }

  navigate(token) async {
    if (token == null) {
      await Navigator.pushNamedAndRemoveUntil(
          context, AppConstants.login, Helper.of(context).predicate);
      // await Navigator.pushNamedAndRemoveUntil(
      //     context, AppConstants.AgendaPage, Helper.of(context).predicate);
    } else {
      await Navigator.pushNamedAndRemoveUntil(
          context, AppConstants.homepage, Helper.of(context).predicate);
      // await Navigator.pushNamedAndRemoveUntil(
      //     context, AppConstants.AgendaPage, Helper.of(context).predicate);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: MyColors.whiteColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: width / 1.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
