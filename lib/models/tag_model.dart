class TagModel {
  String? id;
  String? title;


  TagModel({required this.id,required this.title});



  TagModel.fromJson(Map<String,dynamic> value){
    id = value["id"];
    title = value["title"];
  }

}