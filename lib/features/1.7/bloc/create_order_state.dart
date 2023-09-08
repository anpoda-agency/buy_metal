part of 'create_order_bloc.dart';

abstract class CreateOrderState {
  final PageState pageState;
  const CreateOrderState(this.pageState);
}

class CreateOrderInitial extends CreateOrderState {
  const CreateOrderInitial(PageState pageState) : super(pageState);
}

class CreateOrderUp extends CreateOrderState {
  const CreateOrderUp(PageState pageState) : super(pageState);
}

class CreateOrderError extends CreateOrderState {
  const CreateOrderError(PageState pageState) : super(pageState);
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
