//  بادی اسکرین محتوای بین اپ بار و نو بار هست که از پوستر شروع و تا لیست پادکست ها ادامه داره و در واقع مواردی که در وسط صفحه هوم تغییر میکنه رو اینجا اکسترت ویجت کردیم
import 'package:blog_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../components.dart';
import '../models/fake_data.dart';
import '../strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Assets.images.profileAvatar.image(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.pen, color: SolidColors.colorTitle, size: 25),
              Text(
                MyStrings.imageProfileEdit,
                style: TextStyle(
                  color: SolidColors.colorTitle,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            "حسین افشار",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          SizedBox(height: 10),
          Text(
            "HosseinAfshar@gmail.com",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          SizedBox(height: 20),
          DividerWidget(),
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: Text(MyStrings.myFavBlog),
          ),
          DividerWidget(),
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: Text(MyStrings.myFavPodcast),
          ),
          DividerWidget(),
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: Text(MyStrings.logOut),
          ),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}


