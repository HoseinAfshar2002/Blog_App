import 'dart:math';

import 'package:blog_app/components/commands.dart';
import 'package:blog_app/components/storage.dart';
import 'package:blog_app/controller/file_controller.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/blog_single_model.dart';
import 'package:blog_app/models/tag_model.dart';
import 'package:blog_app/servers/pick_file.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/api_const.dart';
import '../servers/dio_server.dart';

class ManageBlogController extends GetxController {
  RxList<BlogModel> Blog = RxList.empty();
  RxList<TagModel> tagList = RxList.empty();
  Rx<BlogSingleModel> blogInfo = BlogSingleModel(
    title: 'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
    content:
        '''من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی''',
    image: '',
  ).obs;
  RxBool loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController contentTextEditingController = TextEditingController();

  @override
  onInit() {
    super.onInit(); // این خط میگه کارهای پیش‌فرض GetX رو انجام بده
    getManageBlog(); // بعد از اون، داده‌های صفحه اصلی رو از سرور می‌گیریم
  }

  getManageBlog() async {
    loading.value = true;

    var res = await DioServer().methodGet(
      ApiConst.publishByMe + GetStorage().read(Storage.userId),
      //     var res = await DioServer().methodGet(
      //   ApiConst.publishByMe + "1",
    );

    if (res.statusCode == 200) {
      res.data.forEach((item) {
        Blog.add(BlogModel.fromJson(item));
      });
    }
    loading.value = false;
  }

  updateTitle() {
    blogInfo.update((res) {
      res!.title = titleTextEditingController.text;
    });
  }

  updateContent() {
    blogInfo.update((res) {
      res!.content = contentTextEditingController.text;
    });
  }

  PostBlog() async {
   loading.value = true;
   var fileController  = Get.find<FileController>();
   Map<String,dynamic> map = {
   ApiBlogConst.title: blogInfo.value.title,
   ApiBlogConst.content:blogInfo.value.content,
   ApiBlogConst.catId:blogInfo.value.catId,
   ApiBlogConst.userId:GetStorage().read(Storage.userId),
   ApiBlogConst.image:await dio.MultipartFile.fromFile(fileController.file.value.path!),
   ApiBlogConst.command:Commands.store,
   ApiBlogConst.tagList:"[]",

   };

   var res = await DioServer().methodPost(map , ApiConst.postBlog);
   print(res.data.toString());
   loading.value = false;



  }
}
