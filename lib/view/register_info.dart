import 'package:blog_app/controller/register_controller.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/components/strings.dart';
import 'package:blog_app/view/category_screen.dart';
import 'package:blog_app/view/create_blog_intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/colors.dart';
import '../components/components.dart';

// یک نمونه مشترک RegisterController
final RegisterController registerController = Get.put(RegisterController());

class RegisterInfo extends StatelessWidget {
  RegisterInfo({super.key});

  // نمونه کنترلر فقط اینجا ساخته می‌شود
  final RegisterController registerController = Get.put(RegisterController());

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
              const SizedBox(height: 15),
              const Text(
                "به تک‌بلاگ خوش اومدی",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 25),
              const Text(
                "برای ارسال مطلب و پادکست باید حتما ثبت نام کنی",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 50),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: SolidColors.primaryColor,
                ),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        // BottomSheet ایمیل، از Get.find() استفاده می‌کنه
                        return EmailBottomSheet(
                          size: size,
                          hintText: "example@gmail.com",
                        );
                      },
                    );
                  },
                  child: const Text(
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


// BottomSheet وارد کردن ایمیل
class EmailBottomSheet extends StatelessWidget {
  final Size size;
  final String hintText;

  EmailBottomSheet({Key? key, required this.size, required this.hintText})
      : super(key: key);

  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 1.3,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(MyStrings.insertYourEmail),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: EmailInputWidget(hintText: hintText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await registerController.register();
                Navigator.pop(context);
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) =>
                      PassBottomSheet(size: size, hintText: "******"),
                );
              },
              child: const Text("ادامه"),
            ),
          ],
        ),
      ),
    );
  }
}

// BottomSheet وارد کردن پسورد
class PassBottomSheet extends StatelessWidget {
  final Size size;
  final String hintText;

  PassBottomSheet({Key? key, required this.size, required this.hintText})
      : super(key: key);

  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 1.3,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(MyStrings.activateCode),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: PassInputWidget(hintText: hintText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              },
              child: const Text("ادامه"),
            ),
          ],
        ),
      ),
    );
  }
}

// BottomSheet محتوای ایجاد مطلب
class ContentCreateBottomSheet extends StatelessWidget {
  final Size size;
  final String hintText;

  ContentCreateBottomSheet({
    Key? key,
    required this.size,
    required this.hintText,
  }) : super(key: key);

  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2,
      color: Colors.white,
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
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                        builder: (context) => CreateBlogIntro()));
                  },
                  child: Row(
                    children: [
                      Assets.icons.writeArticle.image(height: 40),
                      const SizedBox(width: 5),
                      const Text(
                        "مدیریت مقاله ها",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )
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
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
