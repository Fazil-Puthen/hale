part of 'homewidgetcontrol_bloc.dart';

@immutable
sealed class HomewidgetcontrolState {}

final class HomewidgetcontrolInitial extends HomewidgetcontrolState {}

class wishLoadingstate extends HomewidgetcontrolState{
    void details(){
    print('the loading change ');
  }
}

class Wishsuccessstate extends HomewidgetcontrolState{
  final List<Productmodel> wishlist;
  Wishsuccessstate({required this.wishlist});
    void details(){
    print('the wishsuccess');
  }
}

class WishlistEmptystate extends HomewidgetcontrolState{}
