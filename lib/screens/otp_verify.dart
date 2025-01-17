import 'package:deals_dray/models/login_screen_mode.dart';
import 'package:deals_dray/models/otp_verify_module.dart';
import 'package:deals_dray/services/login_data_post.dart';
import 'package:deals_dray/services/otp_data_post.dart';
import 'package:deals_dray/services/splash_screen_data_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerify extends StatefulWidget {
  final String data;
  final bool isPhone;

  const OtpVerify({super.key, required this.data, required this.isPhone});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  bool resentEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            Image.asset(
              "assets/images/otpImage.png",
              scale: 4,
              color: Colors.black87,
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text("We send an unique OTP number\n to your ${widget.isPhone ? "mobile +91- ${widget.data}" : "email- ${widget.data}"}")
              ],
            ),
            SizedBox(height: 30),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                verifyOtp(
                  OtpVerifyModule(
                    otp: pin,
                    deviceID: getDeviceID,
                    userId: getUserID,
                  ),
                  context,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimerCountdown(
                    format: CountDownTimerFormat.minutesSeconds,
                    enableDescriptions: false,
                    endTime: DateTime.now().add(
                      Duration(
                        minutes: 2,
                      ),
                    ),
                    onEnd: () {
                      setState(() {
                        resentEnable = true;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      if (resentEnable) {
                        sendLoginData(
                          LoginScreenMode(
                            deviceID: getDeviceID,
                            mobileNumber: widget.data,
                          ),
                        );
                        setState(() {});
                      }
                    },
                    child: Text(
                      "SEND AGAIN",
                      style: TextStyle(
                        color: resentEnable ? Colors.black : Colors.black54,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
