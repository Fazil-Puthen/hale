import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'detailpage_event.dart';
part 'detailpage_state.dart';

class DetailpageBloc extends Bloc<DetailpageEvent, DetailpageState> {
  DetailpageBloc() : super(DetailpageInitial()) {
    on<DetailpageEvent>((event, emit) {
      // TODO: implement event handler
    }
    );
     on<DetailedviewEvent>(detailedviewhandler);
  }

  FutureOr<void> detailedviewhandler(DetailedviewEvent event, Emitter<DetailpageState> emit) async{
    final firestore=FirebaseFirestore.instance;
    final documnetsnapshot=await firestore.collection('products').doc(event.docid).get();
    emit(Detailedstate(productsnapshot: documnetsnapshot));
  }
}
