import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_theme/mytheme.dart';
import 'package:flutter_theme/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future myTheme = SharedPreferences.getInstance().then(
      (pref) {
        return pref.getInt("defaultTheme");
      },
    );

    return FutureBuilder(
      future: myTheme,
      builder: (context, snap) {
        if (snap.hasData) {
          return ChangeNotifierProvider<ThemeChanger>(
              create: (context) {
                return ThemeChanger();
              },
              child: FutureBuilder(
                future: myTheme,
                builder: (context, snapshot) {
                  return MyTheme(
                    defaultTheme: snapshot.data,
                  );
                },
              ));
        } else {
          return ChangeNotifierProvider<ThemeChanger>(
              create: (context) {
                return ThemeChanger();
              },
              child: FutureBuilder(
                future: myTheme,
                builder: (context, snapshot) {
                  return MyTheme(
                    defaultTheme: 0,
                  );
                },
              ));
        }
      },
    );
  }
}
