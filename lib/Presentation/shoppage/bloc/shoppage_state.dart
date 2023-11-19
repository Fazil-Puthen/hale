part of 'shoppage_bloc.dart';

@immutable
sealed class ShoppageState {}

final class ShoppageInitial extends ShoppageState {}

class CategorylistsuccessState extends ShoppageState{
  final List<Productmodel> categorylist;
  CategorylistsuccessState({required this.categorylist});
}

class CategorylistfailedState extends ShoppageState{}

class Categoryloadingstate extends ShoppageState{}
