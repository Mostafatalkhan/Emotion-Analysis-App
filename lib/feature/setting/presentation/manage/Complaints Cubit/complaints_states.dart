
import '../../../data/model/complaints_model.dart';

abstract class ComplaintsStates{}

class ComplaintsInitialStates extends ComplaintsStates{}

class ComplaintsSuccessStates extends ComplaintsStates{
  final AddComplaintsModel addComplaintsModel;

  ComplaintsSuccessStates(this.addComplaintsModel);
}

class ComplaintsLoadingStates extends ComplaintsStates{}

class ComplaintsErrorStates extends ComplaintsStates{
  final String error;

  ComplaintsErrorStates(this.error);
}