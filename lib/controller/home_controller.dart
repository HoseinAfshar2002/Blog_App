import 'package:blog_app/models/blog_model.dart'; // وارد کردن مدل بلاگ
import 'package:blog_app/models/podcast_model.dart'; // وارد کردن مدل پادکست
import 'package:blog_app/models/poster_model.dart'; // وارد کردن مدل پوستر
import 'package:blog_app/models/tag_model.dart'; // وارد کردن مدل تگ‌ها
import 'package:blog_app/servers/dio_server.dart'; // وارد کردن سرور برای گرفتن داده‌ها
import 'package:get/get.dart'; // وارد کردن کتابخانه GetX برای مدیریت وضعیت و واکنش‌گرایی
import '../components/api_const.dart'; // وارد کردن آدرس APIها

// این کلاس همه چیز رو برای صفحه اصلی مدیریت می‌کنه
class HomeController extends GetxController {

  // یک متغیر واکنش‌گرای پوستر درست می‌کنیم
  late Rx<PosterModel> poster = PosterModel().obs;

  // لیست تگ‌ها که واکنش‌گراست
  RxList<TagModel> tagList = RxList();

  // لیست بلاگ‌ها که واکنش‌گراست
  RxList<BlogModel> topBlogList = RxList();

  // لیست پادکست‌ها که واکنش‌گراست
  RxList<PodcastModel> topPodcastList = RxList();

  RxBool loading = false.obs;

  // تابعی که وقتی صفحه ساخته شد، خودش اجرا می‌شود
  @override
  onInit() {
    super.onInit(); // این خط میگه کارهای پیش‌فرض GetX رو انجام بده
    getHomeItems(); // بعد از اون، داده‌های صفحه اصلی رو از سرور می‌گیریم
  }

  // تابعی برای گرفتن داده‌ها از سرور
  getHomeItems() async {

    loading.value = true;

    // این خط صدا می‌زند سرور و منتظر می‌ماند تا جواب برسد
    var res = await DioServer().methodGet(ApiConst.getHomeItems);

    // بررسی می‌کنیم که جواب سرور موفق بوده (200 یعنی موفق)
    if (res.statusCode == 200) {

      // سرور داده‌ها را در قالب یک لیست برمی‌گرداند
      // اینجا ما فقط بلاگ‌های پر بازدید را می‌گیریم
      res.data['top_visited'].forEach((item) {
        // هر آیتم را تبدیل می‌کنیم به یک مدل بلاگ و به لیست اضافه می‌کنیم
        topBlogList.add(BlogModel.fromJson(item));

      });


      res.data['top_podcasts'].forEach((item) {
        // هر آیتم را تبدیل می‌کنیم به یک مدل بلاگ و به لیست اضافه می‌کنیم
        topPodcastList.add(PodcastModel.fromJson(item));

      });
      
      
      poster.value = PosterModel.fromJson(res.data['poster']);


      res.data['tags'].forEach((item) {
        // هر آیتم را تبدیل می‌کنیم به یک مدل بلاگ و به لیست اضافه می‌کنیم
        tagList.add(TagModel.fromJson(item));

      });


      loading.value =false;
    }
  }
}
