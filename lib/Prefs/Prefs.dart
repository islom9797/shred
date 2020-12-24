import 'dart:convert';

import 'package:flutter_app1/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  //name related
  static storeName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }

  static Future<String> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }
  static Future<bool> deleteName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  return  prefs.remove("name");
  }
  //user related
  static storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser=jsonEncode(user);
    prefs.setString("user", stringUser);
  }

  static Future<User> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser=prefs.getString("user");
    if(stringUser==null||stringUser.isEmpty){
      return null;
    }
    Map map=jsonDecode(stringUser);
    return User.fromJson(map);
  }
  static Future<bool> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return  prefs.remove("name");
  }
}