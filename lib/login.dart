// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/login_bloc/login_event.dart';

import 'blocs/login_bloc/login_bloc.dart';
import 'blocs/login_bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginErrorState) {
                    return Container(
                      child: Text(state.errorMessage,
                          style: TextStyle(color: Colors.red)),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(
                      emailController.text, passwordController.text));
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1)),
                    labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(
                      emailController.text, passwordController.text));
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1)),
                    labelText: 'Password'),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return CupertinoButton(
                      color: (state is LoginValidState)
                          ? Colors.blue
                          : Colors.grey,
                      onPressed: () {
                        log('logged in ');
                      },
                      child: Text('Login'));
                },
              )
            ]),
      ),
    );
  }
}
