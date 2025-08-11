class Tag {
  String Title;

  Tag({required this.Title});
}

class Blog {
  var id;
  var imageUrl;
  var title;
  var content;
  var writer;
  var writerImageUrl;
  var views;
  var date;

  Blog({
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
    required this.id,
    required this.views,
    required this.writer,
    required this.writerImageUrl,




  });
}

class Podcast {
  var id;
  var imageUrl;
  var title;
  var content;
  var writer;
  var writerImageUrl;
  var views;
  var date;

  Podcast({
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
    required this.id,
    required this.views,
    required this.writer,
    required this.writerImageUrl,




  });
}
