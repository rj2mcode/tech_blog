import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: solidColors.statusBarColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo1',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
      ],
      supportedLocales: const [
        Locale('fa'), //farsi
      ],
      theme: ThemeData(
          fontFamily: "vazir",
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Colors.deepPurpleAccent),
            displayMedium: TextStyle(color: Colors.deepPurpleAccent),
            bodyMedium: TextStyle(color: Colors.deepPurpleAccent),
            titleMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
      home: splashScreen(),
    );
  }
}
