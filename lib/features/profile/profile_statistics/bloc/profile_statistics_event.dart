part of 'profile_statistics_bloc.dart';

abstract class ProfileStatisticsEvent {}

class ProfileStatisticsInit extends ProfileStatisticsEvent {}

class ProfileStatisticsMsgErr extends ProfileStatisticsEvent {
  final String msg;
  ProfileStatisticsMsgErr(this.msg);
}
