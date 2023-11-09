part of 'detailpage_bloc.dart';

@immutable
sealed class DetailpageEvent {}

class DetailedviewEvent extends DetailpageEvent{
  final String docid;
  DetailedviewEvent({required this.docid});
}
