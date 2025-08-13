import 'package:blog_app/colors.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/models/fake_data.dart';
import 'package:blog_app/strings.dart';
import 'package:blog_app/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../components.dart';
import 'body_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // هنگام اجرای اپ ایندکس 0 که ویجت صفحه اصلی است رو فعلا نمایش بده
  var SelectedIndexPage = 0;


  @override
  Widget build(BuildContext context) {
    // اندازه صفحه نمایش فعلی رو می‌گیره (عرض و ارتفاع)
    var size = MediaQuery
        .of(context)
        .size;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: // هدر یا همان اپ بار
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                       showModalBottomSheet(
                         isScrollControlled: true,
                        context: context, builder: (context) {
                       return MenuBottomSheet();
                      },);
                    });
                  },
                  child: Icon(Icons.menu, size: 30)),
              Assets.images.logo2.image(height: size.height / 13.6),
              Icon(Icons.search, size: 30),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: IndexedStack(
                // این یعنی در اصل ایندکس پیش فرض برای نمایش همان مقدار صفر است که در متغیر بالا تعریف شد
                index: SelectedIndexPage,
                // یک لیست می سازد از صفحاتی که می خواهیم در جای دلخواه نمایش داده شود
                children: [
                  // ایندکس 0
                  bodyScreen(size: size),
                  // ایندکس 1
                  profileScreen(size: size),
                  //   با کلیک روی گزینه های نویگیشن بار که هر کدام یک ورودی اینت دارد ان ورودی را برابر با سلکتد ایندکس پیج قرار می دهیم
                ],
              ),
            ),

            // باتم نویگیشن
            BtnNav(
              size: size,
              changeScreen: (int value) {
                // ست استیت برای ری بیلد یا همان اجرای دوباره است
                setState(() {
                  // ایندکسی که در بالا پیش فرض 0 قرار داده شده بود با مقدار نویگیشن که 0 یا 1 است جایگزین میشود و value همان اعداد ورودی فانکشن چنج اسکرین است
                  SelectedIndexPage = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BtnNav extends StatelessWidget {
  const BtnNav({super.key, required this.size, required this.changeScreen});

  final Size size;
  final Function(int value) changeScreen;

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
                InkWell(
                  onTap: () => changeScreen(0),
                  child: Assets.icons.home.image(height: 40),
                ),
                Assets.icons.write.image(height: 40),
                InkWell(
                  // مقدار 1 در فانکشن چنج اسکرین برابر با همان value است که نام ورودی فانکشن است
                  onTap: () => changeScreen(1),
                  child: Assets.icons.user.image(height: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
