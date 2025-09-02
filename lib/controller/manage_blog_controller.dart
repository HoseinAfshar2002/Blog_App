import 'package:blog_app/components/storage.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/blog_single_model.dart';
import 'package:blog_app/models/tag_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/api_const.dart';
import '../servers/dio_server.dart';

class ManageBlogController extends GetxController {
  RxList<BlogModel> Blog = RxList.empty();
  RxList<TagModel> tagList = RxList.empty();
  Rx<BlogSingleModel>blogInfo = BlogSingleModel(
    title: 'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
    content: '''من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی''',
    image: '',

  ).obs;
  RxBool loading = false.obs;

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
    loading.value =false;
  }


}
