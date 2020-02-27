class ProductItemModal {
  String desc;
  String type;
  String name;
  String imageUrl;

  ProductItemModal({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
  });

  factory ProductItemModal.fromJosn(dynamic json){
    return ProductItemModal(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

class ProductListModel {
  List<ProductItemModal> data;
  ProductListModel(this.data);
  factory ProductListModel.fromJosn(List json) {
    print('341245');
    return ProductListModel(
      json.map((i) => ProductItemModal.fromJosn((i))).toList(),
    );
  }
}
