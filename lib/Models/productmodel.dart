class Productmodel{
  final String brand;
  final String name;
  final String category;
  final String description;
  final int price;
  final int quantitiy;
  final List<dynamic> imageurl;
  int? cartquantity;
  int? quantitypricechange;

  Productmodel({
    required this.brand,
    required this.name,
    required this.category, 
    required this.description,
    required this.price,
    required this.quantitiy,
    required this.imageurl,
    this.cartquantity,
    this.quantitypricechange,
  }) ;
}