part of 'detailpage_bloc.dart';

@immutable
sealed class DetailpageEvent {}


 enum Addto{
    cart,
    wishlist,
   }

class DetailedviewEvent extends DetailpageEvent{
  final String docid;
  DetailedviewEvent({required this.docid});
}

class Buttonclickedevent extends DetailpageEvent{
}

class Addtocartevent extends DetailpageEvent{
  final Addto addto;
  final Productmodel productdata;
  final String userid;
  Addtocartevent({
  required this.productdata,
  required this.userid,
  required this.addto});
}

