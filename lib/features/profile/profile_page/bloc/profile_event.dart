part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileInit extends ProfileEvent {}

class ProfileMsgErr extends ProfileEvent {
  final String msg;
  ProfileMsgErr(this.msg);
}

class ProfileLogOut extends ProfileEvent {}

class ProfileUpdate extends ProfileEvent {}
