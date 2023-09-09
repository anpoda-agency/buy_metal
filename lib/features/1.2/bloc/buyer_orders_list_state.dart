// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buyer_orders_list_bloc.dart';

abstract class BuyerOrdersListState {
  final PageState pageState;
  const BuyerOrdersListState(this.pageState);
}

class BuyerOrdersListInitial extends BuyerOrdersListState {
  const BuyerOrdersListInitial(PageState pageState) : super(pageState);
}

class BuyerOrdersListUp extends BuyerOrdersListState {
  const BuyerOrdersListUp(PageState pageState) : super(pageState);
}

class BuyerOrdersListError extends BuyerOrdersListState {
  const BuyerOrdersListError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ApplicationGetCustomerApplicationsResponse response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.response = const ApplicationGetCustomerApplicationsResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ApplicationGetCustomerApplicationsResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      response: response ?? this.response,
    );
  }
}
