import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<Widget> _list = [
    Text("Phone"),
    Text("Email")
  ];
  final List<bool> _isSelected = [
    true,
    false
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_ios_new_sharp),
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
                child: ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < 2; i++) {
                        _isSelected[i] = i == index;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(30),
                  selectedBorderColor: Colors.red,
                  selectedColor: Colors.white,
                  fillColor: Colors.red,
                  constraints: BoxConstraints(
                    minHeight: 40,
                    minWidth: 80,
                  ),
                  isSelected: _isSelected,
                  children: _list,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
