import 'dart:io';

import 'package:blog_app/components/colors.dart';
import 'package:blog_app/controller/blog_controller.dart';
import 'package:blog_app/controller/blog_list_controller.dart';
import 'package:blog_app/controller/blog_single_controller.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/servers/pick_file.dart';
import 'package:blog_app/view/single_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/strings.dart';
import '../controller/home_controller.dart';
import '../controller/manage_blog_controller.dart';
import 'blog_list.dart';

class CreateEditBlog extends StatelessWidget {
  ManageBlogController manageBlogController = Get.put(ManageBlogController());
  HomeController homeController = Get.put(HomeController());

  getTitle() {
    Get.defaultDialog(
      title: "عنوان مقاله",
      titleStyle: TextStyle(color: Colors.white),
      content: TextField(
        controller: manageBlogController.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          hintText: "اینجا بنویس",
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
      radius: 20,
      backgroundColor: SolidColors.primaryColor,
      confirm: ElevatedButton(
        onPressed: () {
          manageBlogController.updateTitle();
          Get.back();
        },
        child: Text("ثبت"),
      ),
    );
  }

  getContent() {
    Get.defaultDialog(
      title: "متن مقاله",
      titleStyle: TextStyle(color: Colors.white),
      content: SingleChildScrollView(
        child: Container(
          height: 200,
          width: 350,
          child: TextField(
            controller: manageBlogController.contentTextEditingController,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.blue),
            decoration: InputDecoration(
              hintText: "اینجا بنویس",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      radius: 20,
      backgroundColor: SolidColors.primaryColor,
      confirm: ElevatedButton(
        onPressed: () {
          manageBlogController.updateContent();
          Get.back();
        },
        child: Text("ثبت"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    fileController.file.value.name == 'nothing'
                        ? Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              image:
                                  manageBlogController.blogInfo.value.image !=
                                          null &&
                                      manageBlogController
                                          .blogInfo
                                          .value
                                          .image!
                                          .isNotEmpty
                                  ? DecorationImage(
                                      image: NetworkImage(
                                        manageBlogController
                                            .blogInfo
                                            .value
                                            .image!,
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null, // یعنی اگه خالی بود هیچ تصویری نذاره
                            ),
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: GradientColors.singleAppbarGradiant,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          )
                        : Image.file(File(fileController.file.value.path!)),

                    //Todo دکمه برگشت یا همون فلش که ترجیح دادم نباشه
                    // Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: Container(
                    //     height: 50,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(100)),
                    //       color: SolidColors.primaryColor
                    //     ),
                    //     child: Icon(
                    //       CupertinoIcons.left_chevron,
                    //       color: Colors.white,
                    //       size: 30,
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            pickFiles();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              color: SolidColors.primaryColor,
                            ),
                            height: 25,
                            width: 120,
                            child: Center(
                              child: Text(
                                "انتخاب تصویر +",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("clicked!");
                      getTitle();
                    },
                    child: SeeMoreBlogListWidget(
                      size: Size(30, 30),
                      title: 'ویرایش عنوان مقاله',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(manageBlogController.blogInfo.value.title!),
                ),

                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    getContent();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SeeMoreBlogListWidget(
                      size: Size(30, 30),
                      title: 'ویرایش متن اصلی مقاله',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(manageBlogController.blogInfo.value.content!),
                ),

                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // 👈 این خیلی مهمه
                      builder: (context) {
                        return Container(
                          height:
                              MediaQuery.of(context).size.height *
                              0.8, // 👈 90 درصد ارتفاع صفحه
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("انتخاب دسته بندی"),
                                SizedBox(height: 10),
                                Expanded(
                                  // 👈 بهتر از SizedBox استفاده کنی که GridView درست کار کنه
                                  child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: homeController.tagList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          manageBlogController
                                                  .blogInfo
                                                  .value
                                                  .catId =
                                              homeController.tagList[index].id!;
                                          manageBlogController.blogInfo.update((
                                            val,
                                          ) {
                                            val?.catName = homeController
                                                .tagList[index]
                                                .id!;
                                            val?.catName = homeController
                                                .tagList[index]
                                                .title!;
                                          });
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8,
                                            5,
                                            8,
                                          ),
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: SolidColors.primaryColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    5,
                                                    8,
                                                    8,
                                                    8,
                                                  ),
                                              child: Text(
                                                homeController
                                                    .tagList[index]
                                                    .title!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SeeMoreBlogListWidget(
                      size: Size(30, 30),
                      title: 'انتخاب دسته بندی ',
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  manageBlogController.blogInfo.value.catName == null
                      ? "test"
                      : manageBlogController.blogInfo.value.catName!,
                ),
                SizedBox(height: 30),

                Container(
                  height: 50,
                  width: 152,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    color: SolidColors.primaryColor,
                  ),
                  child: TextButton(
                   onPressed: (()async=>await manageBlogController.PostBlog()  ) ,
                    child: Text(
                      manageBlogController.loading.value?"ثبر کنید":
                      "ثبت",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget SeeMoreBlogListWidget({required Size size, required String title}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, size.width / 25, 0),
    child: Row(
      children: [
        Icon(CupertinoIcons.pen, color: SolidColors.colorTitle, size: 30),
        Text(
          title,
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
