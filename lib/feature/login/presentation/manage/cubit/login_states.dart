
import '../../../data/model/login_model.dart';

abstract class LoginStates{}

class LoginInitialStates extends LoginStates{}

class LoginSuccessStates extends LoginStates{
  final LoginModel loginModel;

  LoginSuccessStates(this.loginModel);
}

class LoginLoadingStates extends LoginStates{}

class LoginErrorStates extends LoginStates{
  final String error;

  LoginErrorStates(this.error);
}