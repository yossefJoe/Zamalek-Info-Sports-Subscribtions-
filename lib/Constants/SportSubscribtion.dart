import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/Models/Subscribtions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SportSubscribtion {
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

  Future<void> addSubscription(
      String username,
      String email,
      String gameName,
      String fees,
      String subscriptiondate,
      String subscriptioncode,
      String renewal,
      String subscribername) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = await getUserId();

    // Retrieve the user data
    String? jsonString = prefs.getString(userId);
    User user;

    if (jsonString != null) {
      try {
        user = User.fromJson(jsonDecode(jsonString));
      } catch (e) {
        print('Error decoding user JSON: $e');
        user = User(
            userId: userId,
            username: username,
            email: email,
            subscriptions: []);
      }
    } else {
      user = User(
          userId: userId, username: username, email: email, subscriptions: []);
    }

    // Add the new subscription
    user.subscriptions.add(Subscription(
        gameName: gameName,
        fees: fees,
        subscriptiondate: subscriptiondate,
        renewal: renewal,
        subscriptioncode: subscriptioncode,
        subscribername: subscribername));

    // Save the updated user back to shared preferences
    jsonString = jsonEncode(user.toJson());
    await prefs.setString(userId, jsonString);
  }
}
