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
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SeeMoreBlogListWidget(
                    size: Size(30, 30),
                    title: 'ویرایش عنوان مقاله',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(manageBlogController.blogInfo.value.title!),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SeeMoreBlogListWidget(
                    size: Size(30, 30),
                    title: 'ویرایش متن اصلی مقاله',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(manageBlogController.blogInfo.value.content!),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SeeMoreBlogListWidget(
                    size: Size(30, 30),
                    title: 'انتخاب دسته بندی ',
                  ),
                ),
                // SizedBox(
                //   height: 60,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: manageBlogController.blogInfo.value.catId!.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.fromLTRB(0, 8, 5, 8),
                //         child: Container(
                //           height: 20,
                //           decoration: BoxDecoration(
                //             color: Colors.grey,
                //             borderRadius: BorderRadius.all(Radius.circular(20)),
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                //             child: Row(
                //               children: [
                //                 Icon(Icons.tag, color: Colors.white),
                //                 Text(
                //                   manageBlogController.blogInfo.value.catName!,
                //                   style: TextStyle(color: Colors.black),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                SizedBox(height: 20),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget SeeMoreBlogListWidget({required Size size, required String title}) {
  return GestureDetector(
    onTap: () {
      // Get.to(BlogList());
    },
    child: Padding(
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
    ),
  );
}
