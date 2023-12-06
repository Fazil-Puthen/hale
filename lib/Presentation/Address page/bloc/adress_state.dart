part of 'adress_bloc.dart';

@immutable
sealed class AdressState {}

final class AdressInitial extends AdressState {}

class AdressamangeState extends AdressState{
  final List<Adressmodel> adresslist;
  AdressamangeState({
    required this.adresslist,
  });
}

class Adressloadingstate extends AdressState{}

class Adressemptystate extends AdressState{}
