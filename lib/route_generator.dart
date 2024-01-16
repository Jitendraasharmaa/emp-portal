import 'package:flutter/material.dart';
import 'package:rsp_portal/views/pages/about_me_page.dart';
import 'package:rsp_portal/views/pages/add_Device_page.dart';
import 'package:rsp_portal/views/pages/all_projects_page.dart';
import 'package:rsp_portal/views/pages/change_password_page.dart';
import 'package:rsp_portal/views/pages/colleagues_details_page.dart';
import 'package:rsp_portal/views/pages/colleagues_page.dart';
import 'package:rsp_portal/views/pages/device_list_page.dart';
import 'package:rsp_portal/views/pages/holiday_list_page.dart';
import 'package:rsp_portal/views/pages/homepage.dart';
import 'package:rsp_portal/views/pages/leave_add_page.dart';
import 'package:rsp_portal/views/pages/leave_list_page.dart';
import 'package:rsp_portal/views/pages/personal_info_edit_page.dart';
import 'package:rsp_portal/views/pages/personal_info_page.dart';
import 'package:rsp_portal/views/pages/reimbursement_form_page.dart';
import 'package:rsp_portal/views/pages/reimbursement_page.dart';

import 'util/app_constants.dart';
import 'views/pages/login_page.dart';
import 'views/pages/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppConstants.splashPage:
        return MaterialPageRoute(builder: (_) => const Splash());
      case AppConstants.login:
        return MaterialPageRoute(builder: (_) => Loginpage());
      case AppConstants.homepage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case AppConstants.personalInfoPage:
        return MaterialPageRoute(builder: (_) => PersonalInfoPage());
      case AppConstants.personalInfoEditPage:
        return MaterialPageRoute(builder: (_) => PersonalInfoEditPage());
      case AppConstants.aboutMePage:
        return MaterialPageRoute(builder: (_) => AboutMePage());
      case AppConstants.changePasswordPage:
        return MaterialPageRoute(builder: (_) => ChangePasswordPage());
      case AppConstants.deviceListPage:
        return MaterialPageRoute(builder: (_) => DeviceListPage());
      case AppConstants.addDevicePage:
        return MaterialPageRoute(builder: (_) => AddDevicePage());
      case AppConstants.holidayListPage:
        return MaterialPageRoute(builder: (_) => HolidayListPage());
      case AppConstants.leaveListPage:
        return MaterialPageRoute(builder: (_) => LeaveListPage());
      case AppConstants.leaveAddPage:
        return MaterialPageRoute(builder: (_) => LeaveAddPage());
      case AppConstants.allProjectsPage:
        return MaterialPageRoute(builder: (_) => AllProjectsPage());
      case AppConstants.colleaguesPage:
        return MaterialPageRoute(builder: (_) => ColleaguesPage());
      case AppConstants.colleaguesDetailsPage:
        return MaterialPageRoute(builder: (_) => ColleaguesDetailsPage());
      case AppConstants.reimbursementPage:
        return MaterialPageRoute(builder: (_) => ReimbursementPage());
      case AppConstants.reimbursementFormPage:
        return MaterialPageRoute(builder: (_) => ReimbursementFormPage());

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const SafeArea(child: Scaffold(body: Text("Route Error"))));
    }
  }
}
// MaterialPageRoute(builder: (_) => Page())
