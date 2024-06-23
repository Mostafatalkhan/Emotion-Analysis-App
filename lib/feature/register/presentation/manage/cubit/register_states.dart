
import '../../../data/model/register_model.dart';

abstract class RegisterStates{}

class RegisterInitialStates extends RegisterStates{}

class RegisterSuccessStates extends RegisterStates{
  final RegisterModel registerModel;

  RegisterSuccessStates(this.registerModel);

}

class RegisterLoadingStates extends RegisterStates{}

class RegisterErrorStates extends RegisterStates{
  final String error;

  RegisterErrorStates(this.error);
}