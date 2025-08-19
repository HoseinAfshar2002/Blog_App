import 'package:blog_app/components/api_const.dart';

class BlogModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  BlogModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  BlogModel.fromJson(Map<String, dynamic> value) {
    id = value["id"];
    title = value["title"];
    image = ApiConst.hostDlUrl+value["image"];
    catId = value["cat_id"];
    catName = value["cat_name"];
    author = value["author"];
    view = value["view"];
    status = value["status"];
    createdAt = value["created_at"];
  }
}
