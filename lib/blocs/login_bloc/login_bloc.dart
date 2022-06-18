import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/login_bloc/login_event.dart';
import 'package:flutter_bloc_demo/blocs/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangeEvent>((event, emit) {
      if (event.emailValue == "" &&
          EmailValidator.validate(event.emailValue) == false) {
        emit(LoginErrorState('Please enter a valid email address'));
      } else if (event.passwordValue.length < 8) {
        emit(LoginErrorState('Password should be at least 8 characters.'));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmitEvent>((event, emit) {
      emit(LoginLoadingState());
    });
  }
}
