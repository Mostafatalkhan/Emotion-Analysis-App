import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/constant.dart';
import '../../../data/model/about_us_model.dart';
import '../../../data/model/change_pass_model.dart';
import '../../../data/model/contact_model.dart';
import '../../../data/model/notification_model.dart';
import '../../../data/model/profile_model.dart';
import 'setting_states.dart';

class SettingCubit extends Cubit<SettingStates>
{
  SettingCubit():super (SettingInitialStates());
  SettingCubit get(context)=>BlocProvider.of(context);

  NotificationModel? notificationModel;
  void getNotification()
  {
    emit(NotificationLoadingStates());
    ApiService.getData(
        url: 'notifications',
        token: token
    ).then((value)
    {
      notificationModel=NotificationModel.fromJson(value.data);
      emit(NotificationSuccessStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NotificationErrorStates(error.toString()));
    }
    );
  }

  ProfileModel? profileModel;
  void getProfile()
  {
    emit(ProfileLoadingStates());
    ApiService.getData(
        url: 'profile',
        token: token
    ).then((value)
    {
      emit(ProfileLoadingStates());
      profileModel=ProfileModel.fromJson(value.data);
      emit(ProfileSuccessStates(profileModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ProfileErrorStates(error.toString()));
    }
    );
  }

  void updateProfile({
    required String name,
    required String email,
    required String phone,
    // required String image,
  })
  {
    emit(UpdateProfileLoadingStates());
    ApiService.putData(
      url: 'update-profile',
      token: token,
      data: {
        'name':name,
        'email':email,
        'phone':phone,
        //'image':image,
      },
    ).then((value)
    {
      profileModel=ProfileModel.fromJson(value.data);
      emit(UpdateProfileSuccessStates(profileModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(UpdateProfileErrorStates(error.toString()));
    }
    );
  }

  AboutUsModel? aboutUsModel;
  void getAboutUs()
  {
    emit(AboutUsLoadingStates());
    ApiService.getData(
      url: 'settings',
      token: token,
    ).then((value)
    {
      aboutUsModel=AboutUsModel.fromJson(value.data);
      emit(AboutUsSuccessStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(AboutUsErrorStates(error.toString()));
    }
    );
  }

  ContactUsModel? contactUsModel;
  void getContactUs()
  {
    emit(ContactUsLoadingStates());
    ApiService.getData(
        url: 'contacts',
        token: token
    ).then((value)
    {
      contactUsModel=ContactUsModel.fromJson(value.data);
      emit(ContactUsSuccessStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ContactUsErrorStates(error.toString()));
    }
    );
  }

  ChangePasswordModel? changePasswordModel;
  void changePassword({
    required String current_password,
    required String new_password,
  })
  {
    emit(ChangePasswordLoadingStates());
    ApiService.postData(
      url: 'change-password',
      token: token,
      data: {
        'current_password':current_password,
        'new_password':new_password,
      },
    ).then((value)
    {
      changePasswordModel=ChangePasswordModel.fromJson(value.data);
      emit(ChangePasswordSuccessStates(changePasswordModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ChangePasswordErrorStates(error.toString()));
    }
    );
  }
}