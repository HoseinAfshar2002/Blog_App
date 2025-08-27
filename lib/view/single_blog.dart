import 'package:blog_app/components/colors.dart';
import 'package:blog_app/controller/blog_controller.dart';
import 'package:blog_app/controller/blog_list_controller.dart';
import 'package:blog_app/controller/blog_single_controller.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/strings.dart';
import '../controller/home_controller.dart';

class SingleBlog extends StatelessWidget {
  BlogListController blogListController = Get.put(BlogListController());
  BlogController blogController = Get.put(BlogController());
  BlogSingleController blogSingleController = Get.put(BlogSingleController());


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => blogSingleController.loading  == false ? Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(blogSingleController.blogSingleModel.value.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: GradientColors.singleAppbarGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.left_chevron,
                            color: Colors.white,
                            size: 30,
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            CupertinoIcons.bookmark,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.share,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      blogSingleController.blogSingleModel.value.title!
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: Assets.images.profileAvatar.provider(),
                        height: 30,
                      ),
                      SizedBox(width: 10),
                      Text(blogSingleController.blogSingleModel.value.author!),
                      SizedBox(width: 10),
                      Text(blogSingleController.blogSingleModel.value.createdAt!),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      blogSingleController.blogSingleModel.value.content!
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blogSingleController.blogSingleModel.value.catId!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 5, 8),
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                            child: Row(
                              children: [
                                Icon(Icons.tag, color: Colors.white),
                                Text(
                                  blogSingleController.blogSingleModel.value.catName!,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                SizedBox(height: 30),
                SizedBox(
                  height: 250,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: blogSingleController.relatedList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                        onTap: () {
                          blogSingleController.getBlogSingleItems(
                            int.parse(blogSingleController.relatedList[index].id!),
                          );
                          Get.to(SingleBlog());

                        },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
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
                                            blogSingleController
                                                .relatedList[index]
                                                .image!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      height: 150,
                                      width: 150,
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
                                            blogSingleController
                                                .relatedList[index]
                                                .author!,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                blogSingleController
                                                    .relatedList[index]
                                                    .view!,
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
                                    blogSingleController
                                        .relatedList[index]
                                        .title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  width: 100
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ) : SpinKitFadingCircle(
              size: 60,
              color: SolidColors.primaryColor,

            ),
          ),
        ),
      ),
    );
  }
}
