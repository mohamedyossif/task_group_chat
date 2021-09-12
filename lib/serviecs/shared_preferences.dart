import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDatabase
{
  SharedPreferences? prefs;
  bool isCheck = false;
  Future getPreferencesInstance() async {
    prefs = await SharedPreferences.getInstance();

    isCheck = prefs!.getBool('isChecked')??false;
  }
//check
  Future setPreferencesInstance() async {
    prefs = await SharedPreferences.getInstance();

    prefs!.setBool('isChecked', isCheck);
  }
}