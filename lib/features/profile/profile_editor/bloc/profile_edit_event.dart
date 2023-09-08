part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent {}

class ProfileEditInit extends ProfileEditEvent {}

class ProfileEditMsgErr extends ProfileEditEvent {
  final String msg;
  ProfileEditMsgErr(this.msg);
}

class ProfileEditInputFullName extends ProfileEditEvent {
  final String value;
  ProfileEditInputFullName(this.value);
}

class ProfileEditInputCompanyName extends ProfileEditEvent {
  final String value;
  ProfileEditInputCompanyName(this.value);
}

class ProfileEditInputCompanyAddress extends ProfileEditEvent {
  final String value;
  ProfileEditInputCompanyAddress(this.value);
}

class ProfileEditInputTIN extends ProfileEditEvent {
  final String value;
  ProfileEditInputTIN(this.value);
}

class ProfileEditInputPhoneNumber extends ProfileEditEvent {
  final String value;
  ProfileEditInputPhoneNumber(this.value);
}

class ProfileEditInputEmail extends ProfileEditEvent {
  final String value;
  ProfileEditInputEmail(this.value);
}

class ProfileEditSendChanges extends ProfileEditEvent {}
