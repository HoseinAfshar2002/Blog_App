import '../components/api_const.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;


  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,

  });



  PodcastModel.fromJson(Map<String, dynamic> value) {
    id = value["id"];
    title = value["title"];
    poster = ApiConst.hostDlUrl+value["poster"];
    catName = value["cat_name"];
    author = value["author"];
    view = value["view"];
    status = value["status"];
    createdAt = value["created_at"];
  }

}
