import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTheme extends StatelessWidget {

  final int defaultTheme;

  MyTheme({this.defaultTheme});

  static final List<ThemeData> themeData = [
    ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.lightBlueAccent),
    ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        accentColor: Colors.yellowAccent),
    ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        accentColor: Colors.lightGreenAccent),
    ThemeData.dark()
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    List<String> listItem = ['Light Blue', 'Dark Orange', 'Dark Green', 'Dark'];

//int themeIndex = getIntFromShP();
    return MaterialApp(
      theme: _theme.getIndex != null ? themeData[_theme.getIndex]: themeData[defaultTheme],
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Theme List'),
        ),
        body: Material(
          child: ListView.builder(
            itemCount: listItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listItem[index]),
                onTap: () async { //
                  //print(y.toString());
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setInt('defaultTheme', index);
                  _theme.setIndex = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
