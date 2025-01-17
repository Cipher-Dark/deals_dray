class SplashScreenModel {
  String? deviceType;
  String? deviceId;
  String? deviceName;
  String? deviceOSVersion;
  String? deviceIPAddress;
  double? lat;
  double? long;
  String? buyerGcmid;
  String? buyerPemid;
  App? app;

  SplashScreenModel({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOSVersion,
    required this.deviceIPAddress,
    required this.lat,
    required this.long,
    required this.buyerGcmid,
    required this.buyerPemid,
    required this.app,
  });

  factory SplashScreenModel.fromJson(json) {
    return SplashScreenModel(
      deviceType: json['deviceType'],
      deviceId: json['deviceId'],
      deviceName: json['deviceName'],
      deviceOSVersion: json['deviceOSVersion'],
      deviceIPAddress: json['deviceIPAddress'],
      lat: json['lat'],
      long: json['long'],
      buyerGcmid: json['buyer_gcmid'],
      buyerPemid: json['buyer_pemid'],
      app: App.fromJson(json['app']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceType': deviceType,
      'deviceId': deviceId,
      'deviceName': deviceName,
      'deviceOSVersion': deviceOSVersion,
      'deviceIPAddress': deviceIPAddress,
      'lat': lat,
      'long': long,
      'buyer_gcmid': buyerGcmid,
      'buyer_pemid': buyerPemid,
      'app': app!.toJson(),
    };
  }
}

class App {
  String version;
  String installTimeStamp;
  String uninstallTimeStamp;
  String downloadTimeStamp;

  App({
    required this.version,
    required this.installTimeStamp,
    required this.uninstallTimeStamp,
    required this.downloadTimeStamp,
  });

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      version: json['version'],
      installTimeStamp: json['installTimeStamp'],
      uninstallTimeStamp: json['uninstallTimeStamp'],
      downloadTimeStamp: json['downloadTimeStamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'installTimeStamp': installTimeStamp,
      'uninstallTimeStamp': uninstallTimeStamp,
      'downloadTimeStamp': downloadTimeStamp,
    };
  }
}
