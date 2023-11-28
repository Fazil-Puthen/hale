part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}

class OrdersFetchevent extends OrdersEvent{}
