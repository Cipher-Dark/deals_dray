import 'package:deals_dray/models/register_screen_model.dart';
import 'package:deals_dray/services/login_data_post.dart';
import 'package:deals_dray/services/register_data_post.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  left: 10,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      "Let's Begin!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Please enter your credentials and proceed",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Your Email",
                              labelStyle: TextStyle(color: Colors.black54),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Create Password",
                              labelStyle: TextStyle(color: Colors.black54),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: Icon(
                                  isVisible ? Icons.visibility_outlined : Icons.visibility,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            obscureText: !isVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _referralController,
                            decoration: InputDecoration(
                              labelText: "Referral Code (Optional)",
                              labelStyle: TextStyle(color: Colors.black54),
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            registerUser(
                RegisterScreenModel(
                  email: _emailController.text,
                  password: _passwordController.text,
                  referralCode: _referralController.text,
                  userId: getUserID,
                ),
                context);
          }
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[700],
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Icon(Icons.arrow_forward_rounded),
        ),
      ),
    );
  }
}
