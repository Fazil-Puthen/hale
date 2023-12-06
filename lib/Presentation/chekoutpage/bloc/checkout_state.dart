part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

class Checkoutinitstate extends CheckoutState{
  final List<Productmodel> checkoutlist;
  final List<Adressmodel> adreslist;
  final int totslamonut;
  final bool isAdress;

  Checkoutinitstate({
    required this.checkoutlist,
    required this.adreslist,
    required this.isAdress,
    required this.totslamonut,

  });
}

class Checkoutloadingstate extends CheckoutState{}

class RazorpayErrorstate extends CheckoutState{}

class Adressloadingstate extends CheckoutState{}

class Adressfetchstate extends CheckoutState{
  final int index;
  Adressfetchstate({
    required this.index,
  });
}
