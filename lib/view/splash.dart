import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../components/colors.dart';

class splash extends StatefulWidget {


  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(

          builder: (context)=>HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.logo3.image(height: 120),
              SizedBox(height: 30,),
              SpinKitThreeBounce(color: SolidColors.primaryColor, size: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
