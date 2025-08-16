class CategoryModel {
  String? id;
  String? title;


  CategoryModel({required this.id,required this.title});



  CategoryModel.fromJson(Map<String,dynamic> value){
    id = value["id"];
    title = value["title"];
  }

}