import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_bloc.dart';
import 'package:rapid_api_bloc/view/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_bloc.dart'; // Importing the CartBloc

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ApiBloc>(create: (_) => ApiBloc()),
    BlocProvider<CartBloc>(create: (_) => CartBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
