import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/app_update_model.dart';
import '../util/app_constants.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isAuthorized = true;

  Future checkUpdate(String version) async {
    print(version);
    http.Response response = await http.get(
        Uri.parse("${AppConstants.baseUrl}getversion?version=$version"),
        headers: AppConstants.headers);
    print('response.body');
    print('Check Update');
    print(response.body);

    return response.statusCode == 200
        ? AppUpdateModel.fromMap(json.decode(response.body))
        : <AppUpdateModel>[];
  }
}
