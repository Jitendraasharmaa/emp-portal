class AppUpdateModel {
  final String status, version, isForceUpdate, driveLink;
  AppUpdateModel(
      {required this.status,
      required this.version,
      required this.isForceUpdate,
      required this.driveLink});
  factory AppUpdateModel.fromMap(Map<String, dynamic> json) {
    return AppUpdateModel(
      status: json['status'] == null ? "" : json['status'].toString(),
      version: json['status'] == "fail"
          ? ""
          : json['message']['version'] == null
              ? ""
              : json['message']['version'].toString(),
      isForceUpdate: json['status'] == "fail"
          ? ""
          : json['message']['is_force_update'] == null
              ? ""
              : json['message']['is_force_update'].toString(),
      driveLink: json['status'] == "fail"
          ? ""
          : json['message']['drive_link'] == null
              ? ""
              : json['message']['drive_link'].toString(),
    );
  }
}
