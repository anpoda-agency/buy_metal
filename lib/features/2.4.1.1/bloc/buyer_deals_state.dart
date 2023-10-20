// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buyer_deals_bloc.dart';

abstract class BuyerDealsState {
  final PageState pageState;
  const BuyerDealsState(this.pageState);
}

class BuyerDealsInitialState extends BuyerDealsState {
  const BuyerDealsInitialState(PageState pageState) : super(pageState);
}

class BuyerDealsUpState extends BuyerDealsState {
  const BuyerDealsUpState(PageState pageState) : super(pageState);
}

class BuyerDealsErrorState extends BuyerDealsState {
  const BuyerDealsErrorState(PageState pageState) : super(pageState);
}

class BuyerDealsGetDealsState extends BuyerDealsState {
  const BuyerDealsGetDealsState(PageState pageState) : super(pageState);
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
