import 'package:flutter/material.dart';
import 'package:fn_browser/screens/help.dart';
import 'package:fn_browser/screens/web_view_container.dart';
import 'screens/settings.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fn Browser',
      routes: {
        // '/': (context) => App(),
        '/settings': (content) => SettingsPage(),
        '/help': (content) => HelpScreen(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: "Arial",
          textTheme: TextTheme(
              button: TextStyle(color: Colors.white, fontSize: 18.0),
              title: TextStyle(color: Colors.red))),
      home: MyApp(),
    );
  }
}
