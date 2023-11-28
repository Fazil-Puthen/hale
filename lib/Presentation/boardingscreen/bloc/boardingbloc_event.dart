part of 'boardingbloc_bloc.dart';

@immutable
sealed class BoardingblocEvent {}

class Textchangeevent extends BoardingblocEvent{
  final int num;
  Textchangeevent({required this.num});
}
