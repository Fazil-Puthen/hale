part of 'quantity_bloc.dart';

@immutable
sealed class QuantityState {}

final class QuantityInitial extends QuantityState {}

class Quantityaddedestate extends QuantityState{
  final List<Productmodel> cartlist;
  Quantityaddedestate({required this.cartlist});
}
