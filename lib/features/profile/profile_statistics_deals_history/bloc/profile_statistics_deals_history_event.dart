part of 'profile_statistics_deals_history_bloc.dart';

abstract class ProfileStatisticsDealsHistoryEvent {}

class ProfileStatisticsDealsHistoryInit extends ProfileStatisticsDealsHistoryEvent {}

class ProfileStatisticsDealsHistoryMsgErr extends ProfileStatisticsDealsHistoryEvent {
  final String msg;
  ProfileStatisticsDealsHistoryMsgErr(this.msg);
}
