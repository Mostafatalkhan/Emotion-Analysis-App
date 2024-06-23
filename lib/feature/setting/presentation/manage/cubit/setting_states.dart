
import '../../../data/model/change_pass_model.dart';
import '../../../data/model/profile_model.dart';

abstract class SettingStates{}

class SettingInitialStates extends SettingStates{}

class NotificationSuccessStates extends SettingStates{}

class NotificationLoadingStates extends SettingStates{}

class NotificationErrorStates extends SettingStates{
  final String error;

  NotificationErrorStates(this.error);
}

class ProfileSuccessStates extends SettingStates{
  final ProfileModel profileModel;

  ProfileSuccessStates(this.profileModel);
}

class ProfileLoadingStates extends SettingStates{}

class ProfileErrorStates extends SettingStates{
  final String error;

  ProfileErrorStates(this.error);
}

class UpdateProfileSuccessStates extends SettingStates{
  final ProfileModel profileModel;

  UpdateProfileSuccessStates(this.profileModel);


}

class UpdateProfileLoadingStates extends SettingStates{}

class UpdateProfileErrorStates extends SettingStates{
  final String error;

  UpdateProfileErrorStates(this.error);
}

//////////////////////////////
class AboutUsSuccessStates extends SettingStates{}

class AboutUsLoadingStates extends SettingStates{}

class AboutUsErrorStates extends SettingStates{
  final String error;

  AboutUsErrorStates(this.error);
}
//////////////////////////////
class ContactUsSuccessStates extends SettingStates{}

class ContactUsLoadingStates extends SettingStates{}

class ContactUsErrorStates extends SettingStates{
  final String error;

  ContactUsErrorStates(this.error);
}
//////////////////////////////
class ChangePasswordSuccessStates extends SettingStates{
  final ChangePasswordModel changePasswordModel;

  ChangePasswordSuccessStates(this.changePasswordModel);
}

class ChangePasswordLoadingStates extends SettingStates{}

class ChangePasswordErrorStates extends SettingStates{
  final String error;

  ChangePasswordErrorStates(this.error);
}