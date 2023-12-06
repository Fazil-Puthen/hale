import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';
import 'package:hale/common_widgets/constants.dart';

class Passwordreset extends StatefulWidget {
 const Passwordreset({super.key});

  @override
  State<Passwordreset> createState() => _PasswordresetState();
}

class _PasswordresetState extends State<Passwordreset> {
 void timeout()async{
  await Future.delayed(const Duration(seconds: 3));
  Navigator.pop(context);
 }

final formkey=GlobalKey<FormState>();

final emailcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(hale),
              ),
              box,
              Text('You will recive a password reset link in your Mail',
              style: detailfont(13,Colors.black,FontWeight.w200),textAlign: TextAlign.center,),
               Textwidget(
                    text: 'Email',
                    validator: (value) {
                    if(value==null||value.isEmpty){
                    return 'Enter a Email';
                    }
                    else if(!value.contains('@')){
                    return 'Enter a valid Email';
                    }
                    else{
                      return null;
                    }
                    
                  },
                    keyboard: TextInputType.name,
                    control: emailcontroller,
                ),
                box,
                dbox,
                 ContainerButton(
                    color: pinkcolor,
                    onTap: () {
                    
                    context.read<AuthBloc>().add(Passwordresetevent(email:emailcontroller.text.trim())); 
                    },
                    screenwidth: screenwidth * 0.4,
                    screenheight: screenheight * 0.06,
                    heading: 'Reset password'),
                    box,
                    dbox,
                    dbox,
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if(state is PasswordexceptionState){
                          String text=state.error;
                          // emailcontroller.clear();
                        return 
                    Text(text,
                    style: detailfont(13,Colors.red,FontWeight.w200),textAlign: TextAlign.center,);}
                    else if (state is Passwordsuccesssstate){
                      timeout();
                      return Text('reset link sent to your mail',
                    style: detailfont(13,Colors.red,FontWeight.w200),textAlign: TextAlign.center,);
                    }
                    else{
                      return const SizedBox();
                    }
                      },
                    )
        
            ],
        
            
          ),
        ),
      ),
    );
  }
}