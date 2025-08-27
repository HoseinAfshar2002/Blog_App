import 'package:blog_app/models/blog_model.dart';
import 'package:get/get.dart';

import '../components/api_const.dart';
import '../servers/dio_server.dart';

class BlogListController extends GetxController{

  RxList<BlogModel> Blog = RxList();

  RxBool loading = false.obs;



  @override
  onInit() {
    super.onInit(); // این خط میگه کارهای پیش‌فرض GetX رو انجام بده
    getBlogItems(); // بعد از اون، داده‌های صفحه اصلی رو از سرور می‌گیریم
  }

  // تابعی برای گرفتن داده‌ها از سرور
  getBlogItems() async {

    loading.value = true;

    // این خط صدا می‌زند سرور و منتظر می‌ماند تا جواب برسد
    var res = await DioServer().methodGet(ApiConst.getBlogListItems);

    // بررسی می‌کنیم که جواب سرور موفق بوده (200 یعنی موفق)
    if (res.statusCode == 200) {

      // سرور داده‌ها را در قالب یک لیست برمی‌گرداند
      // اینجا ما فقط بلاگ‌های پر بازدید را می‌گیریم
      res.data.forEach((item) {
        // هر آیتم را تبدیل می‌کنیم به یک مدل بلاگ و به لیست اضافه می‌کنیم
        Blog.add(BlogModel.fromJson(item));

      });





      loading.value =false;
    }
  }






  // تابعی برای گرفتن داده‌ها از سرور
  getBlogTagItems(String id) async {
Blog.clear();
    loading.value = true;

    // این خط صدا می‌زند سرور و منتظر می‌ماند تا جواب برسد
    var res = await DioServer().methodGet(ApiConst.baseUrl+'article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');

    // بررسی می‌کنیم که جواب سرور موفق بوده (200 یعنی موفق)
    if (res.statusCode == 200) {

      // سرور داده‌ها را در قالب یک لیست برمی‌گرداند
      // اینجا ما فقط بلاگ‌های پر بازدید را می‌گیریم
      res.data.forEach((item) {
        // هر آیتم را تبدیل می‌کنیم به یک مدل بلاگ و به لیست اضافه می‌کنیم
        Blog.add(BlogModel.fromJson(item));

      });





      loading.value =false;
    }
  }
}