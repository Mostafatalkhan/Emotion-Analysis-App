import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/constant.dart';
import '../../../data/model/complaints_model.dart';
import 'complaints_states.dart';

class ComplaintsCubit extends Cubit<ComplaintsStates>
{
  ComplaintsCubit():super (ComplaintsInitialStates());
  static ComplaintsCubit get(context)=>BlocProvider.of(context);

  AddComplaintsModel? addComplaintsModel;
  void addComplaints({
  required String name,
  required String email,
  required String phone,
  required String message,
})
  {
    emit(ComplaintsLoadingStates());
    ApiService.postData(
        url: 'complaints',
        token: token,
      data: {
          'name':name,
          'email':email,
          'phone':phone,
          'message':message,
      },
    ).then((value)
    {
      addComplaintsModel=AddComplaintsModel.fromJson(value.data);
      emit(ComplaintsSuccessStates(addComplaintsModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ComplaintsErrorStates(error.toString()));
    }
    );
  }
}