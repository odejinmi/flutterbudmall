// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// // import 'package:platform_info/platform_info.dart' as platforminfo;
//
// // import 'package:flutter/services.dart';
//
// // /// Holds data that's different on Android and iOS
// class PlatformInfo {
//   // ignore: unused_field
//   final String userAgent;
//   // ignore: unused_field
//   final String budmallBuild;
//   // ignore: unused_field
//   final String deviceId;
//
//   static Future<PlatformInfo?> getinfo() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//
//     // final platform = platforminfo.Platform.instance.operatingSystem;
//     var mobilephoneinfo;
//     var platform;
//     if (!kIsWeb) {
//       if (Platform.isIOS) {
//         platform = "IOS";
//         mobilephoneinfo = await DeviceInfoPlugin().iosInfo;
//       } else if (Platform.isMacOS) {
//         platform = "MacOs";
//         mobilephoneinfo = await DeviceInfoPlugin().macOsInfo;
//       } else if (Platform.isWindows) {
//         platform = "Windows";
//         mobilephoneinfo = await DeviceInfoPlugin().windowsInfo;
//       } else if (Platform.isLinux) {
//         platform = "Linux";
//         mobilephoneinfo = await DeviceInfoPlugin().linuxInfo;
//       } else if (Platform.isAndroid) {
//         platform = "Android";
//         mobilephoneinfo = await DeviceInfoPlugin().androidInfo;
//       } else {
//         platform = "Others";
//         mobilephoneinfo = await DeviceInfoPlugin().deviceInfo;
//       }
//     } else {
//       platform = "Web";
//     }
//
//     String pluginVersion = packageInfo.version;
//     // : Platform.instance.isIOS
//     //     ? DeviceInfoPlugin().iosInfo
//     //     : "NOT MOBILE";
//     String deviceId = !kIsWeb ? mobilephoneinfo.toString() : "WEB";
//     String userAgent = "${platform}_budmall_$pluginVersion";
//     return PlatformInfo._(
//       userAgent: userAgent,
//       budmallBuild: pluginVersion,
//       deviceId: deviceId,
//     );
//   }
//
//   PlatformInfo._({
//     required String userAgent,
//     required String budmallBuild,
//     required String deviceId,
//   })  : userAgent = userAgent,
//         budmallBuild = budmallBuild,
//         deviceId = deviceId;
//
//   @override
//   String toString() {
//     return '[userAgent = $userAgent, budmallBuild = $budmallBuild, deviceId = $deviceId]';
//   }
// }
