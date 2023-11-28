part of 'adresscheckout_bloc.dart';

@immutable
sealed class AdresscheckoutEvent {}

class AdressinitEvent extends AdresscheckoutEvent{
  final int adressindex;
  AdressinitEvent({required this.adressindex});
}
