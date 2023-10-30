part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileInit extends ProfileEvent {}

class ProfileMsgErr extends ProfileEvent {
  final String msg;
  ProfileMsgErr(this.msg);
}

class ProfileLogOutEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {}

class ProfileGoStatisticEvent extends ProfileEvent {}
