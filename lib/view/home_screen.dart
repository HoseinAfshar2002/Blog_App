import 'package:blog_app/colors.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/models/fake_data.dart';
import 'package:blog_app/strings.dart';
import 'package:blog_app/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'body_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // اندازه صفحه نمایش فعلی رو می‌گیره (عرض و ارتفاع)
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: // هدر یا همان اپ بار
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, size: 30),
              Assets.images.logo2.image(height: size.height / 13.6),
              Icon(Icons.search, size: 30),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(child: bodyScreen(size: size)),

            // باتم نویگیشن
            BtnNav(size: size),
          ],
        ),
      ),
    );
  }
}

class BtnNav extends StatelessWidget {
  const BtnNav({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height / 5.9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: GradientColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            height: size.height / 9,
            width: size.width / 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(colors: GradientColors.bottomNav),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.icons.home.image(height: 40),
                Assets.icons.write.image(height: 40),
                Assets.icons.user.image(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
