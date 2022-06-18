abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  late String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginLoadingState extends LoginState {}
