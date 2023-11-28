part of 'detailpage_bloc.dart';

@immutable
sealed class DetailpageState {}

// bool cartclicked=;
// bool wishclicked=false;

final class DetailpageInitial extends DetailpageState {}

class Detailedstate extends DetailpageState{
  final DocumentSnapshot productsnapshot;
  Detailedstate({required this.productsnapshot});
}

class Buttonclickedstate extends DetailpageState{
  final bool? snackbar;
  final bool? cartclicked;
  final bool? wishclicked;
  final String? snaktext;
  Buttonclickedstate({this.cartclicked,
  this.wishclicked,
  this.snackbar,
  this.snaktext});
  void prindata(){
  }
}