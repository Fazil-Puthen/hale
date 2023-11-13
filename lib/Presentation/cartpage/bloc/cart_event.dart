part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}



class Cartfetchevent extends CartEvent{
  final String userid;
  Cartfetchevent({required this.userid});

  void printstring(){
  }
}

// class Quantityaddordelete extends CartEvent{
//   final Addordelete quantitycontrol;
//   int quantitiy;
//   Quantityaddordelete({required this.quantitycontrol,required this.quantitiy});
// }