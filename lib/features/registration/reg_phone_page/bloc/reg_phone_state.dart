part of 'reg_phone_bloc.dart';

abstract class RegPhoneState {
  final PageState pageState;
  const RegPhoneState(this.pageState);
}

class RegPhoneInitial extends RegPhoneState {
  const RegPhoneInitial(PageState pageState) : super(pageState);
}

class RegPhoneUp extends RegPhoneState {
  const RegPhoneUp(PageState pageState) : super(pageState);
}

class RegPhoneError extends RegPhoneState {
  const RegPhoneError(PageState pageState) : super(pageState);
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
