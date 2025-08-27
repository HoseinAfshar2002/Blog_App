import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/blog_single_model.dart';
import 'package:get/get.dart';

import '../components/api_const.dart';
import '../servers/dio_server.dart';

class BlogSingleController extends GetxController{

Rx<BlogSingleModel> blogSingleModel = BlogSingleModel().obs;
RxList<BlogModel> relatedList = RxList();
 RxBool loading = false.obs;



  @override
  onInit() {
    super.onInit();
    // getBlogSingleItems();
  }

  getBlogSingleItems( int id) async {

    loading.value = true;
   var userId = '';
    var res = await DioServer().methodGet(ApiConst.baseUrl+"article/get.php?command=info&id=$id&user_id=$userId");

    if (res.statusCode == 200) {

    blogSingleModel.value = BlogSingleModel.fromJson(res.data);



    res.data['related'].forEach((item) {
      // هر آیتم را تبدیل می‌کنیم به یک مدل بلاگ و به لیست اضافه می‌کنیم
      relatedList.add(BlogModel.fromJson(item));

    });

      loading.value =false;
    }
  }
}