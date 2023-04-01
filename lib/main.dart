import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/splash_screen.dart';

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
            displayLarge: TextStyle(color: Colors.white),
            displayMedium: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            titleLarge: TextStyle(fontSize: 18, color: Colors.white),
            titleMedium: TextStyle(fontSize: 16, color: Colors.white),
            titleSmall: TextStyle(
                fontSize: 14, color: Color.fromARGB(200, 255, 255, 255)),
            labelLarge: TextStyle(
              fontSize: 18,
            ),
            labelMedium: TextStyle(
              fontSize: 16,
            ),
            labelSmall: TextStyle(
              fontSize: 14,
            ),
          )),
      home: splashScreen(),
    );
  }
}
