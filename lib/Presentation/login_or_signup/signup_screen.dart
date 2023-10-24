import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/login_or_signup/login_screen.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';


class SignUp extends StatelessWidget {
  SignUp({super.key});

  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/full-length-cheerful-woman-denim-clothes-posing-white-wall.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Image.asset(
          'assets/Hale.png',
          scale: 5,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: screenheight * 0.2),
            child: 
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
             if(state is Autherror){
             
             }
             else if(state is SignupsSuccess){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>HomeScreen()), (route) => false);
             }
              },
              builder: (context, state) {
               return
                 Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create Account',
                        style: GoogleFonts.agdasima(fontSize: 40),
                      ),
                    ),
                    Textwidget(
                      text: 'Name',
                      keyboard: TextInputType.name,
                      control: namecontroller,
                    ),
                    loginnbox,
                    Textwidget(
                      text: 'Phone',
                      keyboard: TextInputType.name,
                      control: phonecontroller,
                    ),
                    Textwidget(
                      text: 'Email',
                      keyboard: TextInputType.name,
                      control: emailcontroller,
                    ),
                    loginnbox,
                    Textwidget(
                      text: 'password',
                      keyboard: TextInputType.name,
                      control: passwordcontroller,
                    ),
                    
                    loginnbox,
                        BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if(state is Loadingstate){
                            showDialog(context: context,
                            builder:(context){
                              return const Center(child:CircularProgressIndicator(),);
                            });
                          }
                          else if(state is SigninSuccess){
                            Navigator.of(context).
                            pushAndRemoveUntil(
                              MaterialPageRoute(builder: (ctx)=>HomeScreen()), (route) => false);
                          }
                          else if(state is EmptyFieldState){
                          errorsnackbar('Mandatory fields should not be empty', context);
                          }
                          else if(state is Autherror){
                            errorsnackbar('Email or Password not valid', context);
                          }
                        },
                    
                    child:ContainerButton(
                           color: pinkcolor,
                            screenwidth: screenwidth * 0.4,
                            screenheight: screenheight * 0.06,
                            heading: 'Sign Up',
                             onTap: () {
                              final email = emailcontroller.text.trim();
                              final password = passwordcontroller.text.trim();
                              context.read<AuthBloc>().add(Signupevent(
                                  email: email, password: password));
                             
                            },),),
                            loginnbox,
                            TextButton(onPressed:(){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginPage()));
                            },
                             child:const  Text('Sign In'))
                      
                    
                  ],
                );
              },
            ),
          ),
        ),
      ]))),
    );
  }
}
