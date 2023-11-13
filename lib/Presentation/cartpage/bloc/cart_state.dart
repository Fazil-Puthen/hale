part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartsuccesState extends CartState{
  final List<Productmodel> cartproduct;
  CartsuccesState({required this.cartproduct});
}

// class Quantityaddedestate extends CartState{
//   final int addedquantity;
//   Quantityaddedestate({required this.addedquantity});
// }