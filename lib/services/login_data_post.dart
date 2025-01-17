import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:deals_dray/models/login_screen_mode.dart';

String userId = "";
bool isOtpSend = false;
String get getUserID => userId;
bool get getIsOTP => isOtpSend;
Future<void> sendLoginData(LoginScreenMode deviceData) async {
  String url = "http://devapiv4.dealsdray.com/api/v2/user/otp";

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
      log(response.body);
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData["status"] == 1) {
        userId = responseData["data"]['userId'];
        isOtpSend = true;
      }
    } else {
      log("Error in otp: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    log("Exception: $e");
  }
}
