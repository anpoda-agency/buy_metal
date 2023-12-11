// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class RegPhoneInputErrorState extends RegPhoneState {
  const RegPhoneInputErrorState(PageState pageState) : super(pageState);
}

class RegPhoneError extends RegPhoneState {
  const RegPhoneError(PageState pageState) : super(pageState);
}

class RegPhoneAllowedToPush extends RegPhoneState {
  const RegPhoneAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ActivationCodeUploadSendActivationCodeRequest request;
  final ActivationCodeUploadSendActivationCodeResponse response;

  final bool proneError;
  final String errorText;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const ActivationCodeUploadSendActivationCodeRequest(),
    this.response = const ActivationCodeUploadSendActivationCodeResponse(),
    this.proneError = false,
    this.errorText = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ActivationCodeUploadSendActivationCodeRequest? request,
    ActivationCodeUploadSendActivationCodeResponse? response,
    bool? proneError,
    String? errorText,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
      proneError: proneError ?? this.proneError,
      errorText: errorText ?? this.errorText,
    );
  }
}
