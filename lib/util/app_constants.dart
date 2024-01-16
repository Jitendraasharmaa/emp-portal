class AppConstants {
  static const String appName = 'RSP User Portal App';

  //API URL Constants
  static const String baseUrl = '';

  static Map<String, String> headers = {
    //"X-API-KEY": "OpalIndiaKeysinUse",
    'Charset': 'utf-8',
    'Accept': 'application/json',
  };

  // Shared Key
  static const String token = 'token';
  static const String userID = 'user_id';
  static const String name = 'name';
  static const String image = 'image';
  static const String deviceName = 'device_name';
  static const String imei = 'imei';
  static const String clubID = 'club_id';
  static const String clubName = 'Club_name';

  //Route Key constants
  static const String splashPage = '/splash_page';
  static const String appPages = '/pages';
  static const String login = '/login';
  static const String homepage = '/homepage';
  static const String personalInfoPage = '/personal_info_page';
  static const String personalInfoEditPage = '/personal_info_edit_page';
  static const String aboutMePage = '/about_me_page';
  static const String changePasswordPage = '/change_password_page';
  static const String deviceListPage = '/device_list_page';
  static const String addDevicePage = '/add_device_page';
  static const String holidayListPage = '/holiday_list_page';
  static const String leaveListPage = '/leave_list_page';
  static const String leaveAddPage = '/leave_add_page';
  static const String allProjectsPage = '/all_projects_page';
  static const String colleaguesPage = '/colleagues_page';
  static const String colleaguesDetailsPage = '/colleagues_details_page';
  static const String reimbursementPage = '/reimbursement_page';
  static const String reimbursementFormPage = '/reimbursement_form_page';
}
