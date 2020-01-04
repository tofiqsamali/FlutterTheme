import 'package:shared_preferences/shared_preferences.dart';

String themeName = getFromShP().toString();

addToShP(int th) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('defaultTheme', th);
}

getFromShP() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int value = prefs.getInt('defaultTheme');
//  themeName = stringValue;
  //print(stringValue);
  return value;
}

addIntToShP(int x) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('themeIndex', x);}

getIntFromShP() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int x = prefs.getInt('themeIndex');
  return x;
}