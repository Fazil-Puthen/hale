part of 'boardingbloc_bloc.dart';

@immutable
sealed class BoardingblocState {}

final class BoardingblocInitial extends BoardingblocState {}

class Textsuccessstate extends BoardingblocState{
  final String text;
  final int k;
  Textsuccessstate({required this.text,required this.k});
}
