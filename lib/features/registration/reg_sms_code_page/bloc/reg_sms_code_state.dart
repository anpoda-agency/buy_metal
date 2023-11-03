// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class RegSmsCodeAllowedToPush extends RegSmsCodeState {
  const RegSmsCodeAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ActivationCodeUploadConfirmNumberRequest request;
  final ActivationCodeUploadConfirmNumberResponse response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const ActivationCodeUploadConfirmNumberRequest(),
    this.response = const ActivationCodeUploadConfirmNumberResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ActivationCodeUploadConfirmNumberRequest? request,
    ActivationCodeUploadConfirmNumberResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
