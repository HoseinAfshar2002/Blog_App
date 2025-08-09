import 'package:blog_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     localizationsDelegates: [
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
     ],
     supportedLocales: [
       Locale('fa'), // Farsi.

     ],
     theme: ThemeData(fontFamily: 'dana',


     ),


     home: Scaffold(body:Center(child: Assets.images.logo.image() ,) ,)
   );

  }

}