import 'package:blog_app/components/colors.dart';
import 'package:blog_app/controller/blog_controller.dart';
import 'package:blog_app/controller/blog_list_controller.dart';
import 'package:blog_app/controller/blog_single_controller.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/view/single_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/components.dart';

class BlogListWhithMe extends StatelessWidget {
  BlogListController blogListController = Get.put(BlogListController());
  BlogSingleController blogSingleController = Get.put(BlogSingleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: AppBarWidget("لیست مقاله ها"),automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SizedBox(
            child: Obx(
              () => blogListController.loading == false
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: blogListController.Blog.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            blogSingleController.getBlogSingleItems(
                              int.parse(blogListController.Blog[index].id!),
                            );
                            Get.to(SingleBlog());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        blogListController.Blog[index].image!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      blogListController.Blog[index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          blogListController
                                              .Blog[index]
                                              .author!,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          blogListController.Blog[index].view!,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : SpinKitFadingCircle(
                      size: 60,
                      color: SolidColors.primaryColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
