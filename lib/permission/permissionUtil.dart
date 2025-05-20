import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:vrajme_panel/deviceInfo/deviceInfo.dart';

class PermisssionsUtil {
  PermisssionsUtil._privateConstructor();
  static final PermisssionsUtil instance = PermisssionsUtil._privateConstructor();

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  checkForStoragePermission() async {
    bool permissionObtained = false;
    if (Platform.isAndroid) {
      if (await DeviceInfo.instance.getAndroidSdkVersion() <= 28 &&
          await requestPermission(Permission.storage)) {
        permissionObtained = true;
      } else {
        bool storagePermission = await requestPermission(Permission.storage);
        bool accessMediaLocationPermission =
            await requestPermission(Permission.mediaLibrary);
        bool photosPermission = await requestPermission(Permission.photos);
        permissionObtained = storagePermission &&
            (accessMediaLocationPermission || photosPermission);
      }
    }
    if (Platform.isIOS) {
      bool storagePermission = await requestPermission(Permission.storage);
      bool photosPermission = await requestPermission(Permission.photos);
      permissionObtained = storagePermission && photosPermission;
    }
    return permissionObtained;
  }

  checkForLocationPermission() async {
    bool permissionObtained = false;
    if (Platform.isAndroid) {
      if (await DeviceInfo.instance.getAndroidSdkVersion() <= 28 &&
          await requestPermission(Permission.location)) {
        permissionObtained = true;
      } else {
        //bool locationOnly = await requestPermission(Permission.location);
        bool locationWhenInUse = await requestPermission(Permission.locationWhenInUse);
        bool locationAlways = await requestPermission(Permission.locationAlways);
        permissionObtained = locationWhenInUse || locationAlways;
      }
    }
    if (Platform.isIOS) {
      permissionObtained = await requestPermission(Permission.locationWhenInUse);
    }
    return permissionObtained;
  }
}