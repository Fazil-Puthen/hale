part of 'homewidgetcontrol_bloc.dart';

@immutable
sealed class HomewidgetcontrolEvent {}

class   Wishfetchevent extends HomewidgetcontrolEvent{}

class Wishdeleteevent extends HomewidgetcontrolEvent{}

class WishdeleteEvent extends HomewidgetcontrolEvent{
  final String id;
  WishdeleteEvent({required this.id});
}

class ProfileinitEvent extends HomewidgetcontrolEvent{}

class UpdateprofileEvent extends HomewidgetcontrolEvent{
  final String name,phone;
  UpdateprofileEvent({
    required this.name,
    required this.phone,
  });
}
