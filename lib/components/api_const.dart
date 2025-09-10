import 'package:blog_app/components/commands.dart';

class ApiConst {
  static const hostDlUrl = "https://techblog.sasansafari.com";

  static const hostAddress = "https://techblog.sasansafari.com/Techblog/api";
  static const baseUrl = "$hostAddress/";

  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getBlogListItems =
      "${baseUrl}article/get.php?command=new&user_id=";
  static const postRegister = "${baseUrl}register/action.php";
  static const postBlog = "${baseUrl}article/post.php";
  static const publishByMe =
      "${baseUrl}article/get.php?command=published_by_me&user_id=";
}

class ApiBlogConst{
  static const title = "title";
  static const content = "content";
  static const catId = "cat_id";
  static const userId = "user_id";
  static const image = "image";
  static const command = Commands.store;
  static const tagList = "tag_list";
}