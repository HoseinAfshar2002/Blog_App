import 'dart:math';

import 'package:blog_app/components/api_const.dart';
import 'package:blog_app/components/storage.dart';
import 'package:blog_app/servers/dio_server.dart';
import 'package:blog_app/view/create_blog_intro.dart';
import 'package:blog_app/view/home_screen.dart';
import 'package:blog_app/view/register_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../gen/assets.gen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  var email = '';
  var user_id = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextController.text,
      'command': 'register',
    };
    var response = await DioServer().methodPost(map, ApiConst.postRegister);
    email = emailTextController.text;
    user_id = response.data['user_id'];
    print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': user_id,
      'code': passTextController.text,
      'command': 'verify',
    };
    print(map);
    var response = await DioServer().methodPost(map, ApiConst.postRegister);
    print(response.data.toString());
    var status = response.data['response'];
    //{response: verified, user_id: 632, token: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NjMyLCJlbWFpbCI6Imhvc3NlaW5hZnNoYXJuZXpoYWQyMDAyQGdtYWlsLmNvbSJ9.zLIVFvnbCYAHA-dlVSj6zYILxEmXd6HYGYKzzcDFdJQ}

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(Storage.tokenKey, response.data['token']);
        box.write(Storage.userId, response.data['user_id']);
        print("read ::: " + box.read(Storage.tokenKey));
        print("read ::: " + box.read(Storage.userId));
        Get.offAll(HomeScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعالسازی غلط است!');

        break;

      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده!');
        break;
    }
  }

  checkLogin() {
    if (GetStorage().read(Storage.tokenKey) == null) {
      Get.to(RegisterInfo());
    } else {
      goToBtm();
    }
  }

  goToBtm() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          color: Colors.white,
        ),
        height: Get.height / 2,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.miniBot.image(height: 70),
                    const SizedBox(width: 5),
                    const Text(
                      "دونسته هات رو با بقیه به اشتراک بذار ...",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  """فکر کن !! اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با جامعه‌ی گیک های فارسی زبان به اشتراک بذار..""",
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(CreateBlogIntro());
                    },
                    child: Row(
                      children: [
                        Assets.icons.writeArticle.image(height: 40),
                        const SizedBox(width: 5),
                        const Text(
                          "مدیریت مقاله ها",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint("Podcast");
                    },
                    child: Row(
                      children: [
                        Assets.icons.writePodcastIcon.image(height: 40),
                        const SizedBox(width: 5),
                        const Text(
                          "مدیریت پادکست ها",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
