part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent {}

class ProfileEditInit extends ProfileEditEvent {}

class ProfileEditMsgErr extends ProfileEditEvent {
  final String msg;
  ProfileEditMsgErr(this.msg);
}
