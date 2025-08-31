//  بادی اسکرین محتوای بین اپ بار و نو بار هست که از پوستر شروع و تا لیست پادکست ها ادامه داره و در واقع مواردی که در وسط صفحه هوم تغییر میکنه رو اینجا اکسترت ویجت کردیم
import 'package:blog_app/controller/blog_single_controller.dart';
import 'package:blog_app/controller/home_controller.dart';
import 'package:blog_app/controller/register_controller.dart';
import 'package:blog_app/view/blog_list.dart';
import 'package:blog_app/view/single_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/colors.dart';
import '../models/fake_data.dart';
import '../components/strings.dart';

class bodyScreen extends StatelessWidget {
  bodyScreen({super.key, required this.size});

  HomeController homeController = Get.put(HomeController());
  BlogSingleController blogSingleController = Get.put(BlogSingleController());

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),

      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: homeController.loading.value == false
              ? Column(
                  children: [
                    // فاصله بین هدر و پسوستر
                    SizedBox(height: 20),

                    //  پوستر صفحه اصلی
                    PosterWidget(size: size),

                    // فاصله بین پوستر و لیست تگ
                    SizedBox(height: 18),

                    // لیست تگ ها
                    TagListWidget(size: size),

                    // فاصله بین لیست تگ و داغ ترین نوشته
                    SizedBox(height: 15),

                    // مشاهده داغ ترین نوشته ها
                    SeeMoreBlogListWidget(size: size),

                    //   لیست مقالات داغ ترین ها
                    BlogListWidget(size: size),

                    SizedBox(height: 15),

                    // مشاهده داغ ترین پادکست ها
                    SeeMorePodcast(size: size),

                    //   لیست پادکست داغ ترین ها
                    PodcastListWidget(size: size),
                    // دادن فاصله از پایین برای دیده شده کامل لیست داغ ترین پادکست ها
                    SizedBox(height: 99),
                  ],
                )
              : SpinKitFadingCircle(size: 60, color: SolidColors.primaryColor),
        ),
      ),
    );
  }

  Widget BlogListWidget({required Size size}) {
    return SizedBox(
      height: size.height / 3.85,
      child: Obx(
        () => ListView.builder(
          itemCount: homeController.topBlogList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                blogSingleController.getBlogSingleItems(
                  int.parse(homeController.topBlogList[index].id!),
                );
                Get.to(SingleBlog());
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 6, size.width / 22, 0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(
                                homeController.topBlogList[index].image!,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                homeController.topBlogList[index].author!,
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeController.topBlogList[index].view!,
                                    style: TextStyle(color: Colors.white),
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
                        homeController.topBlogList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      width: size.width / 2.7,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget PodcastListWidget({required Size size}) {
    return SizedBox(
      height: size.height / 3.85,
      child: Obx(
        () => ListView.builder(
          itemCount: homeController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 6, size.width / 22, 0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(
                          homeController.topPodcastList[index].poster!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: size.height / 5.6,
                    width: size.width / 2.4,
                  ),
                  SizedBox(height: 3),

                  SizedBox(
                    child: Text(
                      homeController.topPodcastList[index].title!,
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
    );
  }

  Widget PosterWidget({required Size size}) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.20,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.green,
            image: DecorationImage(
              image: NetworkImage(homeController.poster.value.image!),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text(
              //      homeController.poster.value.!,
              //       style: TextStyle(color: Colors.white, fontSize: 12),
              //     ),
              //     Text(
              //       "Like" + " : " + homePoster["like"],
              //       style: TextStyle(color: Colors.white, fontSize: 12),
              //     ),
              //   ],
              // ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(4, 2, 4, 2),
                child: Text(
                  homeController.poster.value.title!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget TagListWidget({required Size size}) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.tagList.length,
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
                      homeController.tagList[index].title!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget SeeMoreBlogListWidget({required Size size}) {
    return GestureDetector(
      onTap: () {
        Get.to(BlogList());
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, size.width / 25, 0),
        child: Row(
          children: [
            Icon(CupertinoIcons.pen, color: SolidColors.colorTitle, size: 30),
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
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, size.width / 25, 0),
      child: Row(
        children: [
          Icon(CupertinoIcons.mic, color: SolidColors.colorTitle, size: 30),
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
    );
  }
}


