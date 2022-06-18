abstract class LoginEvent {}

class LoginTextChangeEvent extends LoginEvent {
  late String emailValue;
  late String passwordValue;
  LoginTextChangeEvent(this.emailValue, this.passwordValue);
}

class LoginSubmitEvent extends LoginEvent {
  late String email;
  late String password;
  LoginSubmitEvent(this.email, this.password);
}
