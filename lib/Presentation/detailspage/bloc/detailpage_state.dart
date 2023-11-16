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
  final bool? cartclicked;
  final bool? wishclicked;
  Buttonclickedstate({this.cartclicked,
  this.wishclicked});
  void prindata(){
    print('this is cartcliked $cartclicked');
    print('this is wishcliked $wishclicked');
  }
}