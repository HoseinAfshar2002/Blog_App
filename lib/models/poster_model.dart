import '../components/api_const.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({ this.id,  this.title,  this.image});

  PosterModel.fromJson(Map<String, dynamic> value) {
    id = value["id"];
    title = value["title"];
    image = ApiConst.hostDlUrl+value["image"];
  }
}
