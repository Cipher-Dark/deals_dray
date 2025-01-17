import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_ip_address/get_ip_address.dart';

import 'package:deals_dray/models/splash_screen_model.dart';
import 'package:deals_dray/screens/login_screen.dart';
import 'package:deals_dray/services/splash_screen_data_post.dart';

class SplashScreen extends StatefulWidget {
  final Position position;
  const SplashScreen({
    super.key,
    required this.position,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? deviceIp;
  String? deviceName;
  String? deviceId;
  String? deviceVersion;
  String? platformName;

  @override
  void initState() {
    super.initState();
    initialization();
    fetchAndSendDeviceInfo();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 4));
    FlutterNativeSplash.remove();
  }

  Future<void> fetchAndSendDeviceInfo() async {
    await fetchDeviceInfo();

    if (deviceId == null || deviceName == null) {
      log("Error: Device info or location data is missing");
      return;
    }

    await sendSplashData(
      SplashScreenModel(
        deviceType: platformName,
        deviceId: deviceId,
        deviceName: deviceName,
        deviceOSVersion: deviceVersion,
        deviceIPAddress: deviceIp,
        lat: widget.position.latitude,
        long: widget.position.longitude,
        buyerGcmid: "",
        buyerPemid: "",
        app: App(
          version: "1.0",
          installTimeStamp: DateTime.now().toIso8601String(),
          uninstallTimeStamp: DateTime.now().toIso8601String(),
          downloadTimeStamp: DateTime.now().toIso8601String(),
        ),
      ),
    );
  }

  Future<void> fetchDeviceInfo() async {
    try {
      final ipAddress = IpAddress();
      deviceIp = await ipAddress.getIpAddress();

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceName = androidInfo.model;
        deviceId = androidInfo.id;
        deviceVersion = androidInfo.version.release;
        platformName = 'android';
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName = iosInfo.name;
        deviceId = iosInfo.identifierForVendor;
        deviceVersion = iosInfo.systemVersion;
        platformName = 'ios';
      }
    } catch (e) {
      log("Error fetching device info: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
