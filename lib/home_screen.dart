import 'package:blog_app/colors.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // اندازه صفحه نمایش فعلی رو می‌گیره (عرض و ارتفاع)
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 30),
                  Assets.images.logo2.image(height: size.height / 13.6),
                  Icon(Icons.search, size: 30),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: size.width / 1.20,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.green,
                      image: DecorationImage(
                        image: Assets.images.posterTest.provider(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.20,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: GradientColors.homePosterCoverGradiant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
