import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_server;

// کتابخونه‌ی dio رو وارد می‌کنیم
// dio مثل یه راننده‌ست که می‌تونه درخواست‌های HTTP (GET, POST, PUT, DELETE) رو برای ما به سرور بفرسته

class DioServer {
  // اینجا یه کلاس ساختیم به اسم DioServer
  // کلاس یعنی یه جعبه‌ای که می‌تونیم توش متد (تابع) بذاریم و هر وقت لازم شد ازش استفاده کنیم

  Dio dio = Dio();

  // اینجا از کلاس Dio یه شیء (راننده) می‌سازیم
  // این راننده وظیفه داره درخواست ما رو به اینترنت بفرسته

  Future<dynamic> methodGet(String url) async {
    // Future<dynamic> یعنی:
    // ⬅️ این تابع قراره یه نتیجه برگردونه، اما نه همین الان، بلکه "در آینده" (Future)
    // ⬅️ چون ممکنه درخواست به سرور چند ثانیه طول بکشه
    // ⬅️ dynamic یعنی نوع داده‌ی برگشتی مشخص نیست (ممکنه Map باشه، List باشه یا چیز دیگه‌ای)
    // async یعنی داخل این تابع از "await" استفاده می‌کنیم و این تابع غیرهمزمانه (یعنی باید منتظر بمونه تا سرور جواب بده)

    var response = await dio.get(url);
    // با دستور get راننده رو می‌فرستیم به سروری که آدرسش داخل url هست
    // await یعنی: "منتظر بمون تا راننده برگرده و جواب رو بیاره، بعد برو خط بعدی"
    // نتیجه‌ی این درخواست (یعنی پاسخ سرور) میره داخل متغیر response

    return response;
    // آخر سر خود جواب سرور (response) رو به کسی که این تابع رو صدا زده برمی‌گردونیم
  }



















  Future<dynamic> methodPost(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';

    return await dio
        .post(
          url,
          data: dio_server.FormData.fromMap(map),
          options: Options(responseType: ResponseType.json, method: 'POST'),
        )
        .then((response) {
          log(response.headers.toString());
          log(response.data.toString());
          log(response.statusCode.toString());
          return response;
        });
  }
}
