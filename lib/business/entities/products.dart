class Product {
  final String id;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String description;
  final int originalprice;
  final int discountprice;

  Product(
      {required this.id,
      required this.title,
      required this.subtitle1,
      required this.subtitle2,
      required this.originalprice,
      required this.description,
      required this.discountprice});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      subtitle1: json['subtitle1'],
      subtitle2: json['subtitle2'],
      description: json['description'],
      originalprice: json['originalprice'],
      discountprice: json['discountprice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'description': description,
      'originalprice': originalprice,
      'discountprice': discountprice,
    };
  }
}
