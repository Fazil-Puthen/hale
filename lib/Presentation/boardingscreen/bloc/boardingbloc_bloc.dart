import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boardingbloc_event.dart';
part 'boardingbloc_state.dart';

class BoardingblocBloc extends Bloc<BoardingblocEvent, BoardingblocState> {
  BoardingblocBloc() : super(BoardingblocInitial()) {
    on<BoardingblocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Textchangeevent>(textchangehandler);
  }
  int k=1;

  FutureOr<void> textchangehandler(Textchangeevent event, Emitter<BoardingblocState> emit) async{
    await Future.delayed(Duration(seconds: 2));
    late String text;
    k++;
    if(event.num%2==0){
      text='Checkout the new Arrivals';
      print('num==${event.num}');
    }
    else if (event.num%2!=0){
      text='Shop from our trending collection';
      print('num==${event.num}');
    }
    emit(Textsuccessstate(text: text,k: k));
  }
}
