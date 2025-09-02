import 'package:blog_app/components/api_const.dart';

class BlogSingleModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  BlogSingleModel({
    // this.id,
    this.title,
    this.content,
    this.image,
    // this.catId,
    // this.catName,
    // this.author,
    // this.view,
    // this.status,
    // this.createdAt,
    // this.isFavorite,
  });

  BlogSingleModel.fromJson(Map<String, dynamic> value) {
    id = value['info']["id"];
    title = value['info']["title"];
    content = value['info']["content"];
    image = ApiConst.hostDlUrl + value['info']["image"];
    catId = value['info']["cat_id"];
    catName = value['info']["cat_name"];
    author = value['info']["author"];
    view = value['info']["view"];
    status = value['info']["status"];
    createdAt = value['info']["created_at"];
    isFavorite = value["isFavorite"];
  }
}
