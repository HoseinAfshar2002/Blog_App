import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/view/blog_list.dart';
import 'package:blog_app/view/category_screen.dart';
import 'package:blog_app/view/create_blog_intro.dart';
import 'package:blog_app/view/register_info.dart';
import 'package:blog_app/view/single_blog.dart';
import 'package:blog_app/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'components/colors.dart';

void main() {
  //استایل دهی رنگ نوار بالایی و پایینی موبایل
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
   locale: Locale('fa'),
      theme: ThemeData(fontFamily: 'dana'),

      home: splash(),
      // home: RegisterInfo(),
      // home: CategoryScreen(),
      // home: BlogList(),
      // home: SingleBlog(),
      // home: CreateBlogIntro(),
    );
  }
}
