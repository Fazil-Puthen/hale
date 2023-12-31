part of 'adress_bloc.dart';

@immutable
sealed class AdressEvent {}

enum Addordelete{
  add,
  update,
}

class AdressaddEvent extends AdressEvent{
  final String housename;
  final String place;
  final String pincode;
  final Addordelete adresscontrol;
  final int? index;

  AdressaddEvent({
    required this.housename,
    required this.place,
    required this.pincode,
    required this.adresscontrol,
    this.index,
  
  });
}

class AdressdeleteEvent extends AdressEvent{
  final int index;
  AdressdeleteEvent({required this.index});
}

class AdressfetchEvent extends AdressEvent{}