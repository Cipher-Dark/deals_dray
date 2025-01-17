import 'dart:convert';
import 'dart:developer';
import 'package:deals_dray/models/splash_screen_model.dart';
import 'package:http/http.dart' as http;

late String deviceId;
String get getDeviceID => deviceId;
Future<void> sendSplashData(SplashScreenModel deviceData) async {
  String url = "http://devapiv4.dealsdray.com/api/v2/user/device/add";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(deviceData.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData["status"] == 1) {
        deviceId = responseData["data"]['deviceId'];
      }
    } else {
      log("Error: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    log("Exception: $e");
  }
}
