part of 'adresscheckout_bloc.dart';

@immutable
sealed class AdresscheckoutState {}

final class AdresscheckoutInitial extends AdresscheckoutState {}

class AdressloadingState extends AdresscheckoutState{}

class AdressInitstate extends AdresscheckoutState{
  final int adressindex;
  final List<adressmodel> adreslist;
  AdressInitstate({
    required this.adressindex,
    required this.adreslist});
}
