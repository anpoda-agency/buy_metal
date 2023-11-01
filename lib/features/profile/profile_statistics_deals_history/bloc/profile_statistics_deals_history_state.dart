// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_statistics_deals_history_bloc.dart';

abstract class ProfileStatisticsDealsHistoryState {
  final PageState pageState;
  const ProfileStatisticsDealsHistoryState(this.pageState);
}

class ProfileStatisticsDealsHistoryInitial extends ProfileStatisticsDealsHistoryState {
  const ProfileStatisticsDealsHistoryInitial(PageState pageState) : super(pageState);
}

class ProfileStatisticsDealsHistoryUp extends ProfileStatisticsDealsHistoryState {
  const ProfileStatisticsDealsHistoryUp(PageState pageState) : super(pageState);
}

class ProfileStatisticsDealsHistoryError extends ProfileStatisticsDealsHistoryState {
  const ProfileStatisticsDealsHistoryError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final DealUploadSearchRequest request;
  final List<DealUploadSearchResponse> response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const DealUploadSearchRequest(),
    this.response = const [],
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    DealUploadSearchRequest? request,
    List<DealUploadSearchResponse>? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
