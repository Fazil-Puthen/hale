import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/Presentation/cartpage/bloc/cart_bloc.dart';
import 'package:hale/Presentation/cartpage/bloc/quantity_bloc.dart';
import 'package:hale/Presentation/detailspage/bloc/detailpage_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/home_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/homewidgetcontrol_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/shoppage/bloc/shoppage_bloc.dart';
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
    return MultiBlocProvider(
      providers: [ 
        BlocProvider(create:(context) =>AuthBloc()),
        BlocProvider(create: (context)=>HomeBloc()),
        BlocProvider(create: (context) => ShoppageBloc()),
        BlocProvider(create: (context) => DetailpageBloc()),
        BlocProvider(create: (context) => CartBloc(),),
        BlocProvider(create: (context) => QuantityBloc(),),
        BlocProvider(create: (context) => AdressBloc()),
        BlocProvider(create: (context) => HomewidgetcontrolBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:HomeScreen(),
      ),
    );
  }
}
