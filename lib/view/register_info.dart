import 'package:blog_app/colors.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';


import '../components.dart';

class RegisterInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.miniBot.image(height: 150),
              SizedBox(height: 15),
              Text(
                "به تک‌بلاگ خوش اومدی",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 25),
              Text(
                """برای ارسال مطلب و پادکست باید حتما ثبت نام کنی """,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 50),

              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: SolidColors.primaryColor,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return EmailBottomSheet(
                          size: size,
                          hintText: 'Test@gmail.com',
                        );
                      },
                    );
                  },
                  child: Text(
                    "بزن بریم",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailBottomSheet extends StatelessWidget {
  final Size size;
  final String hintText;

  EmailBottomSheet({Key? key, required this.size, required this.hintText})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(MyStrings.insertYourEmail),
            SizedBox(height: 30),
            SizedBox(width: 300, child: PassInputWidget(hintText: hintText)),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: SolidColors.primaryColor,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return PassBottomSheet(size: size, hintText: '******');
                    },
                  );
                },
                child: Text(
                  "ادامه",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PassBottomSheet extends StatelessWidget {
  final Size size;
  final String hintText;

  PassBottomSheet({Key? key, required this.size, required this.hintText})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height /1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(MyStrings.insertYourEmail),
            SizedBox(height: 30),
            SizedBox(width: 300, child: PassInputWidget(hintText: hintText)),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: SolidColors.primaryColor,
              ),
              child: TextButton(
                onPressed: () {

                },
                child: Text(
                  "ادامه",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
