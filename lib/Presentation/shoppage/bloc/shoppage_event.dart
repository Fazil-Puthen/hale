part of 'shoppage_bloc.dart';

@immutable
sealed class ShoppageEvent {}

class Homecategoryselectedevent extends ShoppageEvent{
  final String category;
  Homecategoryselectedevent({required this.category});
}