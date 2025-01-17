import 'dart:convert';

class OtpVerifyModule {
  String otp;
  String deviceID;
  String userId;
  OtpVerifyModule({
    required this.otp,
    required this.deviceID,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "otp": otp,
      "deviceID": deviceID,
      "userId": userId,
    };
  }

  factory OtpVerifyModule.fromMap(Map<String, dynamic> map) {
    return OtpVerifyModule(
      otp: map['otp'] ?? '',
      deviceID: map['deviceID'] ?? '',
      userId: map['userId'] ?? '',
    );
  }

  factory OtpVerifyModule.fromJson(String source) => OtpVerifyModule.fromMap(json.decode(source));

  OtpVerifyModule copyWith({
    String? otp,
    String? deviceID,
    String? userId,
  }) {
    return OtpVerifyModule(
      otp: otp ?? this.otp,
      deviceID: deviceID ?? this.deviceID,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() => 'OtpVerifyModule(otp: $otp, deviceID: $deviceID, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OtpVerifyModule && other.otp == otp && other.deviceID == deviceID && other.userId == userId;
  }

  @override
  int get hashCode => otp.hashCode ^ deviceID.hashCode ^ userId.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'deviceID': deviceID,
      'userId': userId,
    };
  }
}
