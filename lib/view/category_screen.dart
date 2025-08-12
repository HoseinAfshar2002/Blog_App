import 'package:blog_app/components.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/fake_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Assets.images.miniBot.image(height: 150),
              SizedBox(height: 15),
              Text("تبریک میگم ، ایمیل با موفقیت تایید شد"),
              Text("لطفا اطلاعات ثبت نام رو کامل کن"),
              SizedBox(height: 15),
              NameInputWidget(hintText: "نام و نام خانوادگی"),
              Text("دسته بندی هایی که دوست داری رو انتخاب کن"),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 35
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradientColors.tags,
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(34)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.tag, color: Colors.white,size: 12,),
                            SizedBox(width: 5,),
                            Text(
                              tagList[index].Title,
                              style: TextStyle(color: Colors.white,fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Assets.icons.downCatArrow.image(height: 50),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 35
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(34)),
                          color: SolidColors.greyColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.tag, color: Colors.black,size: 12,),
                            SizedBox(width: 5,),
                            Text(
                              tagList[index].Title,
                              style: TextStyle(color: Colors.black,fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    },
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
