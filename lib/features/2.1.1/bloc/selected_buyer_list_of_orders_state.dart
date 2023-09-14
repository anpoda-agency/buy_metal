// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_buyer_list_of_orders_bloc.dart';

abstract class SelectedBuyerListOfOrdersState {
  final PageState pageState;
  const SelectedBuyerListOfOrdersState(this.pageState);
}

class SelectedBuyerListOfOrdersInitial extends SelectedBuyerListOfOrdersState {
  const SelectedBuyerListOfOrdersInitial(PageState pageState) : super(pageState);
}

class SelectedBuyerListOfOrdersUp extends SelectedBuyerListOfOrdersState {
  const SelectedBuyerListOfOrdersUp(PageState pageState) : super(pageState);
}

class SelectedBuyerListOfOrdersError extends SelectedBuyerListOfOrdersState {
  const SelectedBuyerListOfOrdersError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ApplicationUploadSearchRequest request;
  final List<ApplicationUploadSearchResponse> response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const ApplicationUploadSearchRequest(),
    this.response = const [],
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ApplicationUploadSearchRequest? request,
    List<ApplicationUploadSearchResponse>? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
