class ProductInfo {
  int id;
  String title, description, imgUrl;

  ProductInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
  });

  factory ProductInfo.fromJson(data) {
    return ProductInfo(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        imgUrl: data['thumbnail']);
  }
}
