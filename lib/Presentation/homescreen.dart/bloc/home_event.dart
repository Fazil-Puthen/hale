part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitevent extends HomeEvent{}

class Navigationwidgetchangeevent extends HomeEvent{
  final int index;
  final String? category;
  Navigationwidgetchangeevent({required this.index,this.category});
}