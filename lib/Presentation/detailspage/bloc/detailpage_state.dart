part of 'detailpage_bloc.dart';

@immutable
sealed class DetailpageState {}

final class DetailpageInitial extends DetailpageState {}

class Detailedstate extends DetailpageState{
  final DocumentSnapshot productsnapshot;
  Detailedstate({required this.productsnapshot});
}
