import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/components/strings.dart';
import 'package:blog_app/view/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import 'colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 50,
      color: Colors.black,
      indent: 40,
      endIndent: 40,
      thickness: 1.5,
    );
  }
}

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value + " is Email : " + isEmail(value).toString());
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 219, 219, 219),
        ),
      ),
    );
  }
}

class PassInputWidget extends StatelessWidget {
  const PassInputWidget({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value + " is Email : " + isEmail(value).toString());
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 219, 219, 219),
        ),
      ),
    );
  }
}

class NameInputWidget extends StatelessWidget {
  const NameInputWidget({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          onChanged: (value) {},
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 219, 219, 219),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuBottomSheet extends StatelessWidget {
  MenuBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.9,
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
            SizedBox(height: 30),
            Assets.images.logo2.image(height: 70),
            DividerWidget(),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("حساب کاربری", style: TextStyle(fontSize: 25)),
                  Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.black,
                    size: 40,
                  ),
                ],
              ),
            ),
            DividerWidget(),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("درباره مینی بلاگ", style: TextStyle(fontSize: 25)),
                  Icon(
                    CupertinoIcons.text_bubble_fill,
                    color: Colors.black,
                    size: 40,
                  ),
                ],
              ),
            ),
            DividerWidget(),
            InkWell(
              onTap: ()  {
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("اشتراک گذاری مینی بلاگ", style: TextStyle(fontSize: 20)),
                  Icon(
                    CupertinoIcons.share_solid,
                    color: Colors.black,
                    size: 40,
                  ),
                ],
              ),
            ),
            DividerWidget(),
            InkWell(
              onTap: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("گیت هاب مینی بلاگ", style: TextStyle(fontSize: 25)),
                  Icon(
                    CupertinoIcons.arrow_2_squarepath,
                    color: Colors.black,
                    size: 40,
                  ),
                ],
              ),
            ),
            DividerWidget(),
            Text("Created By Hosein Afshar"),


          ],
        ),
      ),
    );
  }
}
