import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hale/Presentation/cartpage/cart_screen.dart';
import 'package:hale/Presentation/detailspage/details_screen.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/login_or_signup/login_screen.dart';
import 'package:hale/Presentation/profile_screen/profile_screen.dart';
import 'package:hale/Presentation/splashscreen/splash_screen.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:Splashscreen(),
      ),
    );
  }
}
