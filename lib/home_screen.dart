import 'package:blog_app/colors.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/models/fake_data.dart';
import 'package:blog_app/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // اندازه صفحه نمایش فعلی رو می‌گیره (عرض و ارتفاع)
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: // هدر یا همان اپ بار
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, size: 30),
              Assets.images.logo2.image(height: size.height / 13.6),
              Icon(Icons.search, size: 30),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // فاصله بین هدر و پسوستر
                  SizedBox(height: 20),

                  //  پوستر صفحه اصلی
                  Stack(
                    children: [
                      Container(
                        width: size.width / 1.20,
                        height: size.height / 4.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.green,
                          image: DecorationImage(
                            image: AssetImage(homePoster["imagePoster"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // اضافه کردن گرادینت بنفش روی کانتینر و تصویر با فورگراند (دیگه نیاز نیست با استفاده از دو کانتینر گرادینت رو اعمال کنیم
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            colors: GradientColors.homePosterCoverGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        left: 0,

                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  homePoster["writer"] + "-" + homePoster["date"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Like" + " : " + homePoster["like"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "دوازده قدم برنامه نویسی یک دوره ی...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // فاصله بین پوستر و لیست تگ
                  SizedBox(height: 18),

                  // لیست تگ ها
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, size.width / 18, 8),
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: GradientColors.tags,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                              child: Row(
                                children: [
                                  Icon(Icons.tag, color: Colors.white),
                                  Text(
                                    tagList[index].Title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // فاصله بین لیست تگ و داغ ترین نوشته
                  SizedBox(height: 15),

                  // مشاهده داغ ترین نوشته ها
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, size.width / 25, 0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.pen,
                          color: SolidColors.colorTitle,
                          size: 30,
                        ),
                        Text(
                          MyStrings.viewHotestBlog,
                          style: TextStyle(
                            color: SolidColors.colorTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //   لیست مقالات داغ ترین ها
                  SizedBox(
                    height: size.height / 3.85,
                    child: ListView.builder(
                      itemCount: blogList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 6, size.width / 22, 0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          blogList[index].imageUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: size.height / 5.6,
                                    width: size.width / 2.4,
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          blogList[index].writer,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              blogList[index].views,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),

                              SizedBox(
                                child: Text(
                                  blogList[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                width: size.width / 2.7,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 15),

                  // مشاهده داغ ترین پادکست ها
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, size.width / 25, 0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.mic,
                          color: SolidColors.colorTitle,
                          size: 30,
                        ),
                        Text(
                          MyStrings.viewHotestPodCasts,
                          style: TextStyle(
                            color: SolidColors.colorTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //   لیست پادکست داغ ترین ها
                  SizedBox(
                    height: size.height / 3.85,
                    child: ListView.builder(
                      itemCount: podcastList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 6, size.width / 22, 0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          podcastList[index].imageUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: size.height / 5.6,
                                    width: size.width / 2.4,
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),

                              SizedBox(
                                child: Text(
                                  podcastList[index].title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                width: size.width / 2.7,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),



            // باتم نویگیشن
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height:size.height/5.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: GradientColors.bottomNavBackground,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: size.height/9,
                    width: size.width/1.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(colors: GradientColors.bottomNav)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Assets.icons.home.image(height: 40),
                        Assets.icons.write.image(height: 40),
                        Assets.icons.user.image(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],

        ),


        
      ),
    );
  }
}
