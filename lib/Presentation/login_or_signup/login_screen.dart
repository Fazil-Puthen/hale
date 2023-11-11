import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:hale/Presentation/login_or_signup/signup_screen.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

import 'auth_bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.17,
                child: Image.asset(
                  'assets/pngwing.com.png',
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
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome\n Back!',
                        style: GoogleFonts.agdasima(fontSize: 40),
                      ),
                    ),
                    Form(
                        key: formkey,
                        child: Column(children: [
                          Textwidget(
                            text: 'Email',
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return 'Enter a Username';
                              }
                              else if(!value.contains('@')){
                                return 'Enter a valid Email';
                              }
                            },
                            keyboard: TextInputType.name,
                            control: emailcontroller,
                          ),
                          Textwidget(
                            validator: (value) {
                              if(value==null||value.isEmpty){
                              return 'Password is mandatory';}
                            },
                            text: 'Password',
                            keyboard: TextInputType.name,
                            control: passwordcontroller,
                          ),
                        ])),
                        loginnbox,
                          BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) => current is Autherror,
                      builder: (context, state) {
                        if(state is Autherror){
                        return Container(width: screenwidth,
                        height: 50,
                        child:  Center(child: Row(
                          children: [const Icon(Icons.error,color: Color.fromARGB(255, 230, 207, 4),),
                            Text('The email or password you entered is not valid',
                            style: detailfont(10,Colors.red,FontWeight.w300),),
                          ],
                        )),);}
                        else{return SizedBox();}
                      },
                    ),
                    loginnbox,
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is Loadingstate) {
                          debugPrint('this is loading state');
                          showDialog(
                              context: context,
                              builder: (context) {
                                return  Center(
                                  child: CircularProgressIndicator(
                                    color: pinkcolor,
                                  ),
                                );
                              });
                        } else if (state is SigninSuccess) {
                          userid=emailcontroller.text.trim();
                          debugPrint('this is success');
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (ctx) => HomeScreen()),
                              (route) => false);
                        } else if (state is Autherror) {
                           Navigator.of(context).pop();
                          emailcontroller.clear();
                          passwordcontroller.clear();
                          debugPrint('this is error');
                          errorsnackbar('Authentication Error', context);
                        }
                      },
                      child: ContainerButton(
                          color: pinkcolor,
                          onTap: () {
                            if(formkey.currentState!.validate()){
                            final email = emailcontroller.text.trim();
                            final password = passwordcontroller.text.trim();
                            context.read<AuthBloc>().add(SignInevent(
                                email: email, password: password));
                          }},
                          screenwidth: screenwidth * 0.4,
                          screenheight: screenheight * 0.06,
                          heading: 'Sign In'),
                    ),
                    loginnbox,
                    loginnbox,
                    const SimpleText(
                      text: 'Or',
                    ),
                    loginnbox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SimpleText(text: 'Creat account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => SignUp()));
                            },
                            child: const Text('Sign Up'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
