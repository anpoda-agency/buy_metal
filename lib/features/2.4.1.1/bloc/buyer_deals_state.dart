part of 'buyer_deals_bloc.dart';

abstract class BuyerDealsState {
  final PageState pageState;
  const BuyerDealsState(this.pageState);
}

class BuyerDealsInitial extends BuyerDealsState {
  const BuyerDealsInitial(PageState pageState) : super(pageState);
}

class BuyerDealsUp extends BuyerDealsState {
  const BuyerDealsUp(PageState pageState) : super(pageState);
}

class BuyerDealsError extends BuyerDealsState {
  const BuyerDealsError(PageState pageState) : super(pageState);
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
