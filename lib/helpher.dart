import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/model.dart';

class Helpher {
  static const baseUrl = "api.reward-dragon.com:8000";

  static var client = http.Client();

  static Future<UserReqIdModel?> getAll() async {
    try {
      var response = await client.get(
          Uri.http(baseUrl, '/customers/customer-josh-reason-today',
              {'user_profile': '500'}),
          headers: {
            'Authorization': 'c3fb04334a7c647338cdfd500e2997bb9898cf52'
          });
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        return userReqIdModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
    } finally {
      debugPrint("final");
      client.close();
    }
  }
}
