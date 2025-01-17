import 'dart:convert';
import 'dart:developer';
import 'package:deals_dray/models/register_screen_model.dart';
import 'package:deals_dray/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> registerUser(RegisterScreenModel registerData, BuildContext context) async {
  String url = "http://devapiv4.dealsdray.com/api/v2/user/email/referral";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(registerData.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 1) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  responseData['data']['message'],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              duration: Duration(seconds: 3),
              showCloseIcon: true,
            ),
          );
        }
        if (responseData['data']['message'] == 'Successfully Added') {
          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreens()),
              (Route<dynamic> route) => false,
            );
          }
        }
      }
    } else {
      log("Error in otp: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    log("Exception: $e");
  }
}
