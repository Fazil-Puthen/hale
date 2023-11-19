part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitevent extends HomeEvent{}

class Navigationwidgetchangeevent extends HomeEvent{
  final int index;
  Navigationwidgetchangeevent({required this.index});
}



