part of 'homewidgetcontrol_bloc.dart';

@immutable
sealed class HomewidgetcontrolState {}

final class HomewidgetcontrolInitial extends HomewidgetcontrolState {}

class WishLoadingstate extends HomewidgetcontrolState{
}

class Wishsuccessstate extends HomewidgetcontrolState{
  final List<Productmodel> wishlist;
  Wishsuccessstate({required this.wishlist});
}

class WishlistEmptystate extends HomewidgetcontrolState{}

class ProfileinintSuccessstate extends HomewidgetcontrolState{
  final Usermodel userdata;
  ProfileinintSuccessstate({
    required this.userdata,
  });
}

class Profileloadingstate extends HomewidgetcontrolState{}

class ProfileFetchErrorstate extends HomewidgetcontrolState{}
