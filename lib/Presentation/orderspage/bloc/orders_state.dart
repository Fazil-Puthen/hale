part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

class Orderfetchedstate extends OrdersState{
  final List<Ordermodel> orderlist;
  Orderfetchedstate({
    required this.orderlist
  });
}

class Orderloadingstate extends OrdersState{}

class OrdereEmptystate extends OrdersState{}
