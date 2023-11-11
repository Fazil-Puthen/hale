class Productmodel{
  final String brand;
  final String name;
  final String category;
  final String description;
  final int price;
  final int quantitiy;
  final List<dynamic> imageurl;

  Productmodel({
    required this.brand,
    required this.name,
    required this.category, 
    required this.description,
    required this.price,
    required this.quantitiy,
    required this.imageurl,
  }) ;
}