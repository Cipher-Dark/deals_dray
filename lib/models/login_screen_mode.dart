import 'dart:convert';

class LoginScreenMode {
  String mobileNumber;
  String deviceID;
  LoginScreenMode({
    required this.mobileNumber,
    required this.deviceID,
  });

  Map<String, dynamic> toMap() {
    return {
      'mobileNumber': mobileNumber,
      'deviceID': deviceID,
    };
  }

  factory LoginScreenMode.fromMap(Map<String, dynamic> map) {
    return LoginScreenMode(
      mobileNumber: map['mobileNumber'] ?? '',
      deviceID: map['deviceId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'deviceId': deviceID,
    };
  }

  factory LoginScreenMode.fromJson(String source) => LoginScreenMode.fromMap(json.decode(source));
}
