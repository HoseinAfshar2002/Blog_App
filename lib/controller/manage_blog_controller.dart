import 'package:blog_app/components/storage.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/api_const.dart';
import '../servers/dio_server.dart';

class ManageBlogController extends GetxController {
  RxList<BlogModel> Blog = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit(); // این خط میگه کارهای پیش‌فرض GetX رو انجام بده
    getManageBlog(); // بعد از اون، داده‌های صفحه اصلی رو از سرور می‌گیریم
  }
  getManageBlog() async {
    loading.value = true;

    // var res = await DioServer().methodGet(
    //   ApiConst.publishByMe + GetStorage().read(Storage.userId),
        var res = await DioServer().methodGet(
      ApiConst.publishByMe + "1",
    );

    if (res.statusCode == 200) {
      res.data.forEach((item) {
        Blog.add(BlogModel.fromJson(item));
      });
    }
    Blog.clear();
    loading.value =false;
  }


}
