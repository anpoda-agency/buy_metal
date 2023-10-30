// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_statistics_bloc.dart';

abstract class ProfileStatisticsState {
  final PageState pageState;
  const ProfileStatisticsState(this.pageState);
}

class ProfileStatisticsInitial extends ProfileStatisticsState {
  const ProfileStatisticsInitial(PageState pageState) : super(pageState);
}

class ProfileStatisticsUp extends ProfileStatisticsState {
  const ProfileStatisticsUp(PageState pageState) : super(pageState);
}

class ProfileStatisticsError extends ProfileStatisticsState {
  const ProfileStatisticsError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final StatisticsGetStatisticsResponse response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.response = const StatisticsGetStatisticsResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    StatisticsGetStatisticsResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      response: response ?? this.response,
    );
  }
}
