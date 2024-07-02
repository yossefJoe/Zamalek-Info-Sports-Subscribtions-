import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/Models/Subscribtions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

String ImagesPath = "assets/images/";
String countriesPath = "assets/images/countries/";
String playersPath = "assets/images/players/";
String coachesPath = "assets/images/coaches/";
String presedintsPath = "assets/images/presedints/";
String legendsPath = "assets/images/legends/";
String trophiesPath = "assets/images/trophies/";
String picsPath = "assets/images/pics/";

class constants {
  Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      var uuid = Uuid();
      userId = uuid.v4();
      await prefs.setString('userId', userId);
    }
    return userId;
  }

  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = await getUserId();

    String? jsonString = prefs.getString(userId);
    if (jsonString != null) {
      return User.fromJson(jsonDecode(jsonString));
    } else {
      return null;
    }
  }

  Future<bool> getemail() async {
    User? user = await getUser();
    if (user != null && user.email.isNotEmpty) {
      return false;
    }
    return true;
  }

  Future<bool> getusername() async {
    User? user = await getUser();
    if (user != null && user!.username.isNotEmpty) {
      return false;
    }
    return true;
  }

  void launchurl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchphone(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  String convertToArabicNumbers(String input) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return input.split('').map((char) {
      if (char.contains(RegExp(r'[0-9]'))) {
        return arabicDigits[int.parse(char)];
      } else {
        return char;
      }
    }).join();
  }
}
