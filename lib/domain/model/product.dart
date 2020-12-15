class Product {
  final String id;
  final String name;
  final String date;
  final String status;
  final String image;
  final int price;
  final String location;
  final String description;

  Product({this.id, this.name, this.date, this.status, this.image, this.price, this.location, this.description});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'],
        name: json['name'],
        date: json['date'],
        status: json['status'],
        image: json['url'],
        price: json['price'],
        location: json['location'],
        description: json['description'],
      );
}
