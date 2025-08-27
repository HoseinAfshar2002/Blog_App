import 'package:blog_app/controller/register_controller.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/components/strings.dart';
import 'package:blog_app/view/blog_list_whith_me.dart';
import 'package:blog_app/view/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:validators/validators.dart';
import '../components/colors.dart';
import '../components/components.dart';

class CreateBlogIntro extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(title: AppBarWidget("مدیریت مقاله ها"),automaticallyImplyLeading: false),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.miniBot1.image(height: 150),
              SizedBox(height: 15),

              Text(
                """هنوز هیچ مقاله ای به جامعه گیک های فارسی 
اضافه نکردی !!! """,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 50),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: SolidColors.primaryColor,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(

                        builder: (context)=>BlogListWhithMe()));

                  },
                  child: Text(
                    "بریم برای نوشتن یه مقاله باحال",
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


