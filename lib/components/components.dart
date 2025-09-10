import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/components/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';
import '../controller/register_controller.dart';
import 'colors.dart';

// یک نمونه مشترک RegisterController
final RegisterController registerController = Get.put(RegisterController());

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 50,
      color: Colors.black,
      indent: 40,
      endIndent: 40,
      thickness: 1.5,
    );
  }
}

class EmailInputWidget extends StatelessWidget {
  final String hintText;
  const EmailInputWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: registerController.emailTextController,
      onChanged: (value) {
        print('$value is Email: ${isEmail(value)}');
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        hintText: "ایمیل خود را وارد کنید",
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 219, 219, 219),
        ),
      ),
    );
  }
}

class PassInputWidget extends StatelessWidget {
  final String hintText;
  const PassInputWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: registerController.passTextController,
      obscureText: true,
      onChanged: (value) {
        print('Password length: ${value.length}');
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        hintText: "رمز عبور خود را وارد کنید",
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
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
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
  const MenuBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Assets.images.logo2.image(height: 70),
            const DividerWidget(),
            // بقیه آیتم‌های منو...
          ],
        ),
      ),
    );
  }
}

class SelectTagsBottomSheet extends StatelessWidget {
  const SelectTagsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Assets.images.logo2.image(height: 70),
            const DividerWidget(),
            // بقیه آیتم‌های منو...
          ],
        ),
      ),
    );
  }
}

Padding AppBarWidget(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10000)),
            color: Color.fromARGB(255, 150, 120, 175),
          ),
          child: const Icon(
            CupertinoIcons.left_chevron,
            color: Colors.white,
            size: 27,
          ),
        ),
        Text(title, style: const TextStyle(color: Color.fromARGB(255, 66, 5, 87))),
      ],
    ),
  );
}

// صفحه ثبت‌نام کامل
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarWidget("ثبت نام")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const NameInputWidget(hintText: "نام خود را وارد کنید"),
            const SizedBox(height: 20),
            const EmailInputWidget(hintText: "ایمیل خود را وارد کنید"),
            const SizedBox(height: 20),
            const PassInputWidget(hintText: "رمز عبور خود را وارد کنید"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                registerController.register();
              },
              child: const Text("ثبت نام"),
            ),
          ],
        ),
      ),
    );
  }
}
