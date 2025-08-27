import 'package:blog_app/components/api_const.dart';
import 'package:blog_app/servers/dio_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
 TextEditingController emailTextController = TextEditingController();
 TextEditingController passTextController = TextEditingController();

 register()async{
  Map<String,dynamic>map = {
   'email':emailTextController.text,
   'command':'register'
  };
  var response = await DioServer().methodPost(map,ApiConst.postRegister);
  print(response);
 }
}