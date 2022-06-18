// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/cubit/internet_cubit.dart';
import 'package:flutter_bloc_demo/login.dart';
import 'blocs/internet_bloc/internet_bloc.dart';
import 'blocs/internet_bloc/internet_state.dart';
import 'blocs/login_bloc/login_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            //bloc builder builds widget
            child:
                // BlocBuilder<InternetBloc, InternetState>(
                //builder: (context, state) {
                //   if (state is InternetLostState) {
                //     return const Text('DisConnected');
                //   } else if (state is InternetGainedState) {
                //     return const Text('Connected');
                //   } else {
                //     return const Text('Connecting..');
                //   }
                // }),
                //listen and checks background data or show dialog snackbars
                //     BlocListener<InternetBloc, InternetState>(listener: (context, state) {
                //   if (state is InternetGainedState) {
                //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content: Text('Internet connected'),
                //       backgroundColor: Colors.green,
                //     ));
                //   }
                // }),
                //consumer listen and build both

                //using bloc
                // BlocConsumer<InternetBloc, InternetState>(
                //using cubit
                BlocConsumer<InternetCubit, InternetCubitState>(
                    listener: (context, state) {
      //using 'is' in bloc
      // if (state is InternetGainedState) {
      //using '==' in cubit beacuse enum use huda state is value but bloc ko case ma it is datatype
      if (state == InternetCubitState.Gained) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Internet connected'),
          backgroundColor: Colors.green,
        ));
      }
    }, builder: (context, state) {
      if (state == InternetCubitState.Lost) {
        return const Text('DisConnected');
      } else if (state == InternetCubitState.Gained) {
        return Column(
          children: [
            Text('Connected'),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('Login')),
          ],
        );
      } else {
        // return const Text('Connecting..');
        return Column(
          children: [
            Text('Connected'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => LoginBloc(),
                                child: LoginPage(),
                              )));
                },
                child: Text('Login')),
          ],
        );
      }
    })));
  }
}
