part of 'quantity_bloc.dart';

@immutable
sealed class QuantityEvent {}

enum Addordelete{
  add,
  delete,
}

class Quantityaddordelete extends QuantityEvent{
  final Addordelete quantitycontrol;
  int quantitiy;
  final String productid;
  final List<Productmodel> cartlist;
  final int index;
  
  Quantityaddordelete({
    required this.quantitycontrol,
    required this.quantitiy,
    required this.productid,
    required this.cartlist,
    required this.index});

  void printline(){
    print('this is the event');
  }
}