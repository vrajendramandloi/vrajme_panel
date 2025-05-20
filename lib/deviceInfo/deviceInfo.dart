import 'dart:collection';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:vrajme_panel/deviceInfo/deviceModel.dart';

class DeviceInfo {
  final deviceInfoPlugin = DeviceInfoPlugin();
  Map detailsMap = HashMap();
  Map versionDetails = HashMap();
  DeviceInfo._privateConstructor() {
    getDeviceInfo();
  }
  static final DeviceInfo instance = DeviceInfo._privateConstructor();
  
  getDeviceInfo() async {
    final BaseDeviceInfo info = await deviceInfoPlugin.deviceInfo;
    final Map infoMap = info.toMap();
    infoMap.forEach((key, value) {
      detailsMap[key] = value;
    });
  }

  getAndroidSdkVersion () async {
    if(detailsMap.isEmpty ) {await getDeviceInfo();}
    versionDetails.addAll(detailsMap["version"]);
    return versionDetails["sdkInt"];
  }

  getAndroidReleaseId () async {
    if(detailsMap.isEmpty ) {getDeviceInfo();}
    versionDetails.addAll(detailsMap["version"]);
    return versionDetails["release"];
  }

  Future<DeviceDetailsModel?> getDeviceInfoObject() async {
    if (Platform.isAndroid) {
      return getAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      return getIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
    return getUnknownDeviceInfo(await deviceInfoPlugin.webBrowserInfo);
  }

  Future<Map<String, dynamic>?> getDeviceInfoJson() async {
    if (Platform.isAndroid) {
      return getAndroidBuildData(await deviceInfoPlugin.androidInfo).toJson();
    } else if (Platform.isIOS) {
      return getIosDeviceInfo(await deviceInfoPlugin.iosInfo).toJson();
    }
    return getUnknownDeviceInfo(await deviceInfoPlugin.webBrowserInfo).toJson();
  }

  DeviceDetailsModel getAndroidBuildData(AndroidDeviceInfo build) {
    return DeviceDetailsModel(
      os:'ANDROID',
      brand:build.brand,
      device:build.device,
      model:build.model,
      lastInstalledOn: DateTime.now().millisecondsSinceEpoch.toString(),
      versionRelease: build.version.sdkInt.toString()+"--"+build.version.release.toString()
    );
  }

  DeviceDetailsModel getIosDeviceInfo(IosDeviceInfo data) {
    return DeviceDetailsModel(
      os:'IOS',
      brand:'APPLE',
      device:data.systemVersion,
      model:data.model,
      lastInstalledOn: DateTime.now().millisecondsSinceEpoch.toString(),
      versionRelease: data.utsname.release.toString() +"--"+ data.utsname.version.toString()
    );
  }

  DeviceDetailsModel getUnknownDeviceInfo(WebBrowserInfo data) {
    return DeviceDetailsModel(
      os:'UNKNOWN',
      brand:'UNKNOWN',
      device:'UNKNOWN',
      model:'UNKNOWN',
      lastInstalledOn: DateTime.now().millisecondsSinceEpoch.toString(),
      versionRelease: data.appVersion.toString()
    );
  }
}


