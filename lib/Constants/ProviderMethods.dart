import 'package:flutter/material.dart';
import 'package:new_project/Models/Subscribtions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZamalekProvider with ChangeNotifier {
  String selectedSport = 'Football';
  void changeSport(String sport) {
    selectedSport = sport;
    notifyListeners();
  }

  bool member = false;
  void memberornot(bool value) {
    member = value;
    notifyListeners();
  }

  List<String> sports = [
    'Volleyball',
    'Handball',
    'Football',
    'Basketball',
    'Swimming',
    'Tennis',
    'GYM'
  ];
  List<int> memberfees = [100, 150, 200, 200, 300, 500, 600];
  List<int> notmemberfees = [150, 200, 250, 300, 400, 600, 700];
  int getfees() {
    if (member == true) {
      return memberfees[sports.indexOf(selectedSport)];
    } else {
      return notmemberfees[sports.indexOf(selectedSport)];
    }
  }

  String newstate = 'true';
  void changerenewalstate(Subscription snap) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    snap.renewal == newstate;
    prefs.setString(
        "is_renewed${snap.subscriptioncode}", snap.renewal.toString());
    notifyListeners();
  }

  Future<String> getrenewalstate(Subscription snap) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String renewalstate =
        prefs.getString("is_renewed${snap.subscriptioncode}") ?? 'false';
    notifyListeners();

    return renewalstate;
  }

  Locale _locale = Locale('ar', '');
  Locale get locale => _locale;
  void change_language() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_locale.languageCode == 'ar') {
      _locale = Locale('en', '');
      prefs.setBool("is_arabic", false);
    } else if (_locale.languageCode == 'en') {
      _locale = Locale('ar', '');
      prefs.setBool("is_arabic", true);
    }
    notifyListeners();
  }

  ZamalekProvider(bool is_arabic) {
    if (is_arabic) {
      _locale = Locale('ar', '');
    } else {
      _locale = Locale('en', '');
    }
  }
}
