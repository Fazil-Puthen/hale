import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/boardingscreen/bloc/boardingbloc_bloc.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:lottie/lottie.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.withOpacity(0.1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/loading.json',
              height: 200,
              width: 200,
              repeat: true,
            ),
            const SizedBox(
              height: 25,
            ),
            textchange()
          ],
        ),
      ),
    );
  }
}

class textchange extends StatefulWidget {
  const textchange({
    super.key,
  });
  @override
  State<textchange> createState() => _textchangeState();
}

class _textchangeState extends State<textchange> {
  @override
  void initState() {
    context.read<BoardingblocBloc>().add(Textchangeevent(num:1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardingblocBloc, BoardingblocState>(
      builder: (context, state) {
        if(state is Textsuccessstate){
          final k=state.k;
          print('this is the $k');
        for(int i=k;i<-1;i++){
        context.read<BoardingblocBloc>().add(Textchangeevent(num:i));}
          final text=state.text;
        return Text(
          text,
          style: detailfont(15, Colors.black, FontWeight.w400),
        );}
        else{
          return const Text('hello there');
        }
      },
    );
  }
}
