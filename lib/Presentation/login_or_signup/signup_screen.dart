import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale/Presentation/boardingscreen/intropages.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/login_or_signup/login_screen.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';


class SignUp extends StatelessWidget {
  SignUp({super.key});

  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();
  

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
            // BlocConsumer<AuthBloc, AuthState>(
            //   listener: (context, state) {
            //  if(state is Autherror){
             
            //  }
            //  else if(state is SignupSuccess){
            //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>HomeScreen()), (route) => false);
            //  }
            //   },
              // builder: (context, state) {
              //  return
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
                      validator: (value) {
                        if(value==null||value.isEmpty)
                        {
                          return 'Please enter your name';
                        }
                        else{return validateName(value);}
                      },
                      text: 'Name',
                      keyboard: TextInputType.name,
                      control: namecontroller,
                    ),
                    loginnbox,
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Textwidget(
                                validator: (value) {
                              if(value==null||value.isEmpty)
                              {
                                return 'Please enter phone number';
                              }
                              else if(value.length<10||value.length>10){
                                return 'Phone number should be  10 digits';
                              }
                              else{
                                return null;
                              }
                            },
                            text: 'Phone',
                            keyboard: TextInputType.number,
                            control: phonecontroller,
                          ),
                          Textwidget(
                                validator: (value) {
                              if(value==null||value.isEmpty)
                              {
                                return 'Email is mandatory';
                              }
                              else if(!value.contains('@')){
                                return 'Not a valid email';
                              }
                              else{
                                return null;
                              }
                            },
                            text: 'Email',
                            keyboard: TextInputType.name,
                            control: emailcontroller,
                          ),
                          loginnbox,
                          Textwidget(
                                validator: (value) {
                              if(value==null||value.isEmpty)
                              {
                                return 'Password is mandatory';
                              }
                              else{
                                return null;
                              }
                            },
                            text: 'password',
                            keyboard: TextInputType.name,
                            control: passwordcontroller,
                          ),
                        ],
                      ),
                    ),
                    
                    loginnbox,
                        BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if(state is SignupLoadingstate){
                            showDialog(context: context,
                            builder:(context){
                              return Center(child:CircularProgressIndicator(color: pinkcolor,),);
                            });
                          }
                          else if(state is SignupSuccess){
                            userid=emailcontroller.text.trim();
                            username=namecontroller.text;
                            Navigator.of(context).
                            pushAndRemoveUntil(
                              MaterialPageRoute(builder: (ctx)=>const  Intropage()), (route) => false);
                          }
                          else if(state is SignupAutherror){
                            emailcontroller.clear();
                            passwordcontroller.clear();
                            Navigator.of(context).pop();
                            errorsnackbar('Email or Password not valid', context);
                          }
                        },
                    
                    child:ContainerButton(
                           color: pinkcolor,
                            screenwidth: screenwidth * 0.4,
                            screenheight: screenheight * 0.06,
                            heading: 'Sign Up',
                             onTap: () {
                             if(formkey.currentState!.validate()){
                              String name=namecontroller.text.trim();
                              String phone=phonecontroller.text.trim();
                              final email = emailcontroller.text.trim();
                              final password = passwordcontroller.text.trim();
                              context.read<AuthBloc>().add(Signupevent(
                                name: name,
                                phone: phone,
                                  email: email, 
                                  password: password));
                             
                            }},),),
                            loginnbox,
                            TextButton(onPressed:(){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginPage()));
                            },
                             child: Text('Sign In',
                             style: detailfont(14,const Color.fromARGB(255, 4, 135, 241),FontWeight.w300),))
                      
                    
                  ],
                ),
              // },
            // ),
          ),
        ),
      ]))),
    );
  }
}
