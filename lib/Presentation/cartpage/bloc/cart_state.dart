part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartsuccesState extends CartState{
  final List<Productmodel> cartproduct;
  final int total;
  CartsuccesState({required this.cartproduct,
  required this.total});
}

class Cartloadingstate extends CartState{}
// class Quantityaddedestate extends CartState{
//   final int addedquantity;
//   Quantityaddedestate({required this.addedquantity});
// }