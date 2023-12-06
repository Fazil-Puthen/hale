part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}

class OrdersFetchevent extends OrdersEvent{}

class DeleteItemEvent extends OrdersEvent{
  final int index;
  final String docId;
  final BuildContext ctx;
  DeleteItemEvent({
    required this.index,
    required this.docId,
    required this.ctx,
  });
}
