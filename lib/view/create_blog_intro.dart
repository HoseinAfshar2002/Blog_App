import 'package:blog_app/controller/manage_blog_controller.dart';
import 'package:blog_app/controller/register_controller.dart';
import 'package:blog_app/gen/assets.gen.dart';
import 'package:blog_app/components/strings.dart';
import 'package:blog_app/view/blog_list.dart';
import 'package:blog_app/view/category_screen.dart';
import 'package:blog_app/view/create_edit_blog.dart';
import 'package:blog_app/view/single_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:validators/validators.dart';
import '../components/colors.dart';
import '../components/components.dart';
import '../models/data_model.dart';

class CreateBlogIntro extends StatelessWidget {
  ManageBlogController manageBlogController = Get.put(ManageBlogController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarWidget("مدیریت مقاله ها"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () =>manageBlogController.loading.value?LoadingWidget(): manageBlogController.Blog.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: manageBlogController.Blog.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {

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
                                      manageBlogController.Blog[index].image!,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    manageBlogController.Blog[index].title!,style: TextStyle(fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        manageBlogController.Blog[index].author!,
                                      ),
                                      Text(
                                        manageBlogController.Blog[index].view!,
                                      ),
                                      Text(
                                        'تایید شده ',
                                        style: TextStyle(color: Colors.blue),
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
                  ) : EmptyBlogWidget(),
          ),
        ),
        bottomNavigationBar:    Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: SolidColors.primaryColor,
          ),
          child: TextButton(
            onPressed: () {
              Get.to(CreateEditBlog());

            },
            child: Text(
              "بریم برای نوشتن یه مقاله باحال",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyBlogWidget extends StatelessWidget {
  const EmptyBlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.miniBot1.image(height: 150),
          SizedBox(height: 15),

          Text(
            """هنوز هیچ مقاله ای به جامعه گیک های فارسی 
اضافه نکردی !!! """,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 50),


        ],
      ),
    );
  }
}
