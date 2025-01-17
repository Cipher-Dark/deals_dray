import 'package:deals_dray/models/login_screen_mode.dart';
import 'package:deals_dray/screens/otp_verify.dart';
import 'package:deals_dray/services/login_data_post.dart';
import 'package:deals_dray/services/splash_screen_data_post.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPhone = true;
  bool _isEmpty = true;
  int _currentIndex = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/images/logo.png",
                      scale: 2,
                    ),
                  ),
                ),
                Center(
                  child: ToggleSwitch(
                    minWidth: 110,
                    cornerRadius: 25,
                    minHeight: 40,
                    activeBgColor: [
                      Colors.red[800]!,
                      Colors.red[800]!,
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: _currentIndex,
                    totalSwitches: 2,
                    labels: [
                      'Phone',
                      'Email'
                    ],
                    radiusStyle: true,
                    onToggle: (index) {
                      setState(() {
                        _isPhone = index == 0;
                        _currentIndex = index!;
                      });
                    },
                  ),
                ),
                Text(
                  "Glad to see you!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Please provide your ",
                      style: TextStyle(color: Colors.grey[600], fontSize: 15),
                    ),
                    _isPhone
                        ? Text(
                            "phone number.",
                            style: TextStyle(color: Colors.grey[600], fontSize: 15),
                          )
                        : Text(
                            "email.",
                            style: TextStyle(color: Colors.grey[600], fontSize: 15),
                          )
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: textEditingController,
                  keyboardType: _isPhone ? TextInputType.numberWithOptions() : null,
                  onChanged: (value) {
                    if (_isPhone ? (value.length == 10) : (RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value))) {
                      setState(() {
                        _isEmpty = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: _isPhone ? "Phone" : "Email",
                    labelStyle: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _isEmpty
                        ? ScaffoldMessenger(
                            child: SnackBar(
                              content: Text("Please enter correct in format."),
                            ),
                          )
                        : sendLoginData(
                            LoginScreenMode(
                              deviceID: getDeviceID,
                              mobileNumber: textEditingController.text,
                            ),
                          );
                    if (getIsOTP) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerify(data: textEditingController.text, isPhone: _isPhone),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _isEmpty ? Colors.red[300] : Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "SEND CODE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
