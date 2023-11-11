part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class Cartfetchevent extends CartEvent{
  final String userid;
  Cartfetchevent({required this.userid});
}
