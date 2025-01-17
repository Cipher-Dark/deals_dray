import 'dart:convert';
import 'dart:developer';
import 'package:deals_dray/models/otp_verify_module.dart';
import 'package:deals_dray/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> verifyOtp(OtpVerifyModule otpData, BuildContext context) async {
  String url = "http://devapiv4.dealsdray.com/api/v2/user/otp/verification";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(otpData.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 2) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  'OTP Expired',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.red[100],
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
      } else if (responseData['status'] == 3) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  'Invalid OTP',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.red,
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
      } else if (responseData['status'] == 1) {
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
        if (responseData['data']['registration_status'] == 'Incomplete') {
          if (context.mounted) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
          }
        }
      } else {
        log("Error occured");
      }
    } else {
      log("Error in otp: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    log("Exception: $e");
  }
}
