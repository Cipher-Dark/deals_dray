import 'dart:convert';

import 'package:flutter/widgets.dart';

class RegisterScreenModel {
  String email;
  String password;
  String? referralCode;
  String userId;
  RegisterScreenModel({
    required this.email,
    required this.password,
    this.referralCode,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "referralCode": referralCode,
      "userId": userId
    };
  }

  factory RegisterScreenModel.fromMap(Map<String, dynamic> map) {
    return RegisterScreenModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      referralCode: map['referralCode'],
      userId: map['userId'] ?? '',
    );
  }

  factory RegisterScreenModel.fromJson(String source) => RegisterScreenModel.fromMap(json.decode(source));

  RegisterScreenModel copyWith({
    String? email,
    String? password,
    ValueGetter<String?>? referralCode,
    String? userId,
  }) {
    return RegisterScreenModel(
      email: email ?? this.email,
      password: password ?? this.password,
      referralCode: referralCode != null ? referralCode() : this.referralCode,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() {
    return 'RegisterScreenModel(email: $email, password: $password, referralCode: $referralCode, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterScreenModel && other.email == email && other.password == password && other.referralCode == referralCode && other.userId == userId;
  }

  @override
  int get hashCode {
    return email.hashCode ^ password.hashCode ^ referralCode.hashCode ^ userId.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'referralCode': referralCode,
      'userId': userId,
    };
  }
}
