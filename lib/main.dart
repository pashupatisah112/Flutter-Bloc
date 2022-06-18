import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_demo/cubit/internet_cubit.dart';
import 'package:flutter_bloc_demo/home_screen.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //internet bloc is not available in all the pages now because it is included in main.dart
      // using bloc
      // create: (context) => InternetBloc(),
      //using cubit
      create: (context) => InternetCubit(),

      child: const MaterialApp(home: HomeScreen()),
    );
  }
}
