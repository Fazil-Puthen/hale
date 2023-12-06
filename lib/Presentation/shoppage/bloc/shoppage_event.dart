part of 'shoppage_bloc.dart';

enum Seperate{
  price,
  item,
}


@immutable
sealed class ShoppageEvent {}

class Homecategoryselectedevent extends ShoppageEvent{
  final String? category;
  final int? price;
  final Seperate selection;
  Homecategoryselectedevent({this.category,
  this.price,
  required this.selection});
}