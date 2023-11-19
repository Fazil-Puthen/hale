part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class Navigationchangestate extends HomeState{
  final int index;
  Navigationchangestate({required this.index});

  void details(){
    print('the navigation change $index');
  }
}

