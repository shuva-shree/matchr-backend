import 'package:flutter/material.dart';
import 'package:loginapp/provider/listOfMatches.dart';
import 'package:loginapp/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
    MultiProvider(providers: providers,
    child: MyApp(),
    ),
    );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ListOfMatchesProvider>(create: (_) => ListOfMatchesProvider()),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.pinkAccent,
        fontFamily: 'Raleway',         
      ),
      home:SplashScreen(),
    );
  }
}
