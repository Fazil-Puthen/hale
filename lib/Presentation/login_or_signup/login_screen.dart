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
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is Loadingstate) {
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (ctx) => HomeScreen()),
                              (route) => false);
                        } else if (state is Autherror) {
                          errorsnackbar('nothing', context);
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
