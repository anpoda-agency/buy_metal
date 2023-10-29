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

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
    );
  }
}
