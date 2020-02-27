class NewsItemModal {
  String title;
  String author;
  String content;

  NewsItemModal({
    this.title,
    this.author,
    this.content,
  });

  factory NewsItemModal.fromJosn(dynamic json){
    return NewsItemModal(
      title: json['title'],
      author: json['author'],
      content: json['content'],
    );
  }
}

class NewsListModel {
  List<NewsItemModal> data;
  NewsListModel(this.data);
  factory NewsListModel.fromJosn(List json) {
    return NewsListModel(
      json.map((i) => NewsItemModal.fromJosn((i))).toList(),
    );
  }
}
