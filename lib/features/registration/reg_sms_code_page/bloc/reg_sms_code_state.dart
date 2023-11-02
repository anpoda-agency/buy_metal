part of 'reg_sms_code_bloc.dart';

abstract class RegSmsCodeState {
  final PageState pageState;
  const RegSmsCodeState(this.pageState);
}

class RegSmsCodeInitial extends RegSmsCodeState {
  const RegSmsCodeInitial(PageState pageState) : super(pageState);
}

class RegSmsCodeUp extends RegSmsCodeState {
  const RegSmsCodeUp(PageState pageState) : super(pageState);
}

class RegSmsCodeError extends RegSmsCodeState {
  const RegSmsCodeError(PageState pageState) : super(pageState);
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
