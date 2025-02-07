import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps => length > 0 ?'${this[0].toUpperCase()}${substring(1)}':'';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.inCaps).join(" ");
}

class AppUtils {
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');
  static SizedBox voidBox({double width=1, double height=1}) => SizedBox(width: width, height: height,);
  static SizedBox standardVerticalGap({double height=15}) => SizedBox(height: height,);
  static SizedBox standardHorizontalGap({double width=15}) => SizedBox(width: width,);
  static Divider standardHorizontalRule() => Divider(color: Colors.grey[300],);

  static getDiaryId() {
    return generateRandomString(4) + DateTime.now().microsecondsSinceEpoch.toString();
  }
  static String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }
  static bool isAssetImage(String path) {
    return !isEmpty(path) && path.startsWith("lib") ? true : false;
  }
  static String isNumber(String val) {
    return isEmpty(val) || val.toLowerCase() == "null" ? "0.0" : val;
  }
  static bool isTrackerNameValid(String displayName) {
    bool isValidLength = !AppUtils.isEmpty(displayName) && displayName.length <=15;
    bool isRegexValid = nameRegExp.hasMatch(displayName);
    bool isRegexNameNumberValid = nameRegExp.hasMatch(displayName) && numberRegExp.hasMatch(displayName);
    return isValidLength && (isRegexValid ||isRegexNameNumberValid);
  }
  static getTrackerName(String name) {
    return name.toUpperCase().replaceAll(" ", "_");
  }
  static getFileName(String path) {
    return isEmpty(path) ? "" : path.substring(path.lastIndexOf("/")+1);
  }
  static DateTime getCalToday() {
    DateTime today = DateTime.now();
    return DateTime(today.year, today.month, today.day, 0, 0 );
  }
  static String getCalTodayString() {
    DateTime today = DateTime.now();
    return today.year.toString()+"-"+today.month.toString().padLeft(2,"0")
                  +"-"+today.day.toString().padLeft(2,"0");
  }
  static Widget getTextHeading(String text, double size, Color backColor, Color textColor) {
    return Center (
      child: Card(
        elevation: 1,
        color: backColor,
        child: Text(text, style: TextStyle(fontSize: size, color: textColor, fontWeight: FontWeight.bold),),
      )
    );
  }
  static bool isEmpty(dynamic val) {
    if(val == null) return true;
    if(val.toString().trim().isEmpty) return true;
    return false;
  }
  static bool isWeekend(DateTime dt) {
    return dt.weekday == DateTime.saturday || dt.weekday == DateTime.sunday ? true : false;
  }

  static Map<int, DateTime> getDatesInMonth(int month, int year) {
    int daysInMonth = DateTime(year, month + 1, 0).day;
    Map<int, DateTime> dates = {};
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(year, month, day);
      dates[day] = date;
    }
    return dates;
  }

  static DateTime getNextMonth(DateTime dt) {
    int year = dt.month == 12 ? dt.year+1: dt.year;
    int month = dt.month == 12 ? 1: dt.month+1;
    return DateTime(year, month, 1);
  }
  static DateTime getPrevMonth(DateTime dt) {
    int year = dt.month == 1 ? dt.year-1: dt.year;
    int month = dt.month == 1 ? 12: dt.month-1;
    return DateTime(year, month, 1);
  }
  static bool compareDateTimewithCurrentTime(DateTime dt) {
    DateTime nowDate = DateTime.now().add(const Duration(minutes: 30));
    return nowDate.compareTo(dt) <= 0;
  }

  static Future<List<String>> getAllFilesInDirectory (String directory) async {
    List<String> dirList =[] ;
    final dir = Directory(directory);
    List<FileSystemEntity> entities = await dir.list().toList();
    entities.forEach(print);
    for (var element in entities) {
      dirList.add(element.path);
    }
    return dirList;
  }


  static final Map<String, IconData> planIconMap = { "FREE":Icons.link, "ALL": Icons.security};
  static final Map<int, String> monthsDetails = {1: "January", 2:"February", 3:"March", 4:"April",
                                    5:"May", 6:"June", 7:"July", 8:"August",
                                    9:"September", 10:"October", 11:"November", 12:"December",};
  static final Map<int, String> SHORTMONTH_DETAILS = {1: "Jan", 2:"Feb", 3:"Mar", 4:"Apr",
                                    5:"May", 6:"Jun", 7:"Jul", 8:"Aug", 9:"Sep", 10:"Oct", 11:"Nov", 12:"Dec",};
  static final Map<int, String> weekdayDetails = {1: "Monday", 2:"Tuesday", 3:"Wednesday", 4:"Thursday",
                                    5:"Friday", 6:"Saturday", 7:"Sunday"}; 
  static String getString(String str) {
    return isEmpty(str) ? "" : str;
  }
  static bool isDirectoryAvailable(String dirPath) {
    return !AppUtils.isEmpty(dirPath) && Directory(dirPath).existsSync();
  }
  static bool isDirectoryNotEmpty(String dirPath) {
    if(!AppUtils.isEmpty(dirPath) && Directory(dirPath).existsSync()) {
      List<FileSystemEntity> entityList = Directory(dirPath).listSync();
      return entityList.length > 5 ? true : false;
    }
    return false;
  }

  static DateTime getDateAndTime(DateTime date, TimeOfDay time) {
    if(date == null) {
      return DateTime.now();
    }
    if(time == null) {
      return DateTime(date.year, date.month, date.day, 0, 0 );
    }
    return DateTime(date.year, date.month, date.day, time.hour, time.minute );
  }
  static getCircularLoader() {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.black.withOpacity(0.5),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
  static getTodayMonthYear () {
    DateTime dt = DateTime.now();
    return dt.year.toString()+dt.month.toString();
  }
  static getTextInput(BuildContext context, Widget inputWidget) {
    return GestureDetector(
      onTap: () {    FocusManager.instance.primaryFocus?.unfocus();    },
      child: inputWidget
    );
  }
  static formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours=  twoDigits(duration.inHours);
    final minutes=  twoDigits(duration.inMinutes.remainder(60));
    final seconds=  twoDigits(duration.inSeconds.remainder(60));

    return [ if(duration.inHours > 0)  hours,  minutes, seconds ].join(':');
  }
  static Widget getBorderedText(String text, double size, Color backColor, Color textColor, double margin) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: backColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.grey,offset: Offset(0,2),
          blurRadius: 2
          ),
        ]
      ),
      padding: EdgeInsets.only(left: margin, right: margin, top: margin/2, bottom: margin/2),
      child: Text(text, style: TextStyle(fontSize: size, fontWeight: FontWeight.bold,
          color: textColor),textAlign: TextAlign.center,),
    );
  }

  static String getCurrentDate() {
    return getDate(DateTime.now());
  }
  static String getDate(DateTime dt) {
    if(dt == null) {
      return "";
    }
    return dt.year.toString()+"-"+dt.month.toString()+"-"+dt.day.toString();
  }
  static Future<bool> checkConnectivity() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }

  static getWidgetFromTop(BuildContext context, Widget widget) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return widget;
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }

  /* static getCircleAvatarWithTitle({Gradient gradient= Colors.grey[200], String title = "Dark Blue", double radius = 40}) {
    return Column(
      children: [
        CircleAvatar(
            radius: radius,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: gradient
              ),
            ),
          ),
          AppUtils.standardVerticalGap(),
          CustomTextLabel(title, size: 10, isBold: true,)
        ]
      );
  } */
}