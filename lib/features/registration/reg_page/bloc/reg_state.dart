// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reg_bloc.dart';

abstract class RegState {
  final PageState pageState;
  const RegState(this.pageState);
}

class RegInitial extends RegState {
  const RegInitial(PageState pageState) : super(pageState);
}

class RegUp extends RegState {
  const RegUp(PageState pageState) : super(pageState);
}

class RegInputErrorState extends RegState {
  const RegInputErrorState(PageState pageState) : super(pageState);
}

class RegError extends RegState {
  const RegError(PageState pageState) : super(pageState);
}

class RegAllowedToPush extends RegState {
  const RegAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final AuthUploadRegisterNewUserRequest request;
  final AuthUploadRegisterNewUserResponse response;
  final String repeatPassword;

  final bool typeProfileError;
  final String errorTypeProfileText;
  final bool fullNameError;
  final String errorFullNameText;
  final bool companyNameError;
  final String errorCompanyNameText;
  final bool companyAddressError;
  final String errorCompanyAddressText;
  final bool tinError;
  final String errorTinText;
  final bool emailError;
  final String errorEmailText;
  final bool passwordError;
  final String errorPasswordText;
  final bool repeatPasswordError;
  final String errorRepeatPasswordText;

  const PageState({
    //this.request = const AuthUploadRegisterNewUserRequest(),
    //this.response = const AuthUploadRegisterNewUserResponse(),
    this.onAwait = false,
    this.errMsg = '',
    this.request = const AuthUploadRegisterNewUserRequest(),
    this.response = const AuthUploadRegisterNewUserResponse(),
    this.repeatPassword = '',
    this.typeProfileError = false,
    this.errorTypeProfileText = '',
    this.fullNameError = false,
    this.errorFullNameText = '',
    this.companyNameError = false,
    this.errorCompanyNameText = '',
    this.companyAddressError = false,
    this.errorCompanyAddressText = '',
    this.tinError = false,
    this.errorTinText = '',
    this.emailError = false,
    this.errorEmailText = '',
    this.passwordError = false,
    this.errorPasswordText = '',
    this.repeatPasswordError = false,
    this.errorRepeatPasswordText = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthUploadRegisterNewUserRequest? request,
    AuthUploadRegisterNewUserResponse? response,
    String? repeatPassword,
    bool? typeProfileError,
    String? errorTypeProfileText,
    bool? fullNameError,
    String? errorFullNameText,
    bool? companyNameError,
    String? errorCompanyNameText,
    bool? companyAddressError,
    String? errorCompanyAddressText,
    bool? tinError,
    String? errorTinText,
    bool? emailError,
    String? errorEmailText,
    bool? passwordError,
    String? errorPasswordText,
    bool? repeatPasswordError,
    String? errorRepeatPasswordText,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
      repeatPassword: repeatPassword ?? this.repeatPassword,
      typeProfileError: typeProfileError ?? this.typeProfileError,
      errorTypeProfileText: errorTypeProfileText ?? this.errorTypeProfileText,
      fullNameError: fullNameError ?? this.fullNameError,
      errorFullNameText: errorFullNameText ?? this.errorFullNameText,
      companyNameError: companyNameError ?? this.companyNameError,
      errorCompanyNameText: errorCompanyNameText ?? this.errorCompanyNameText,
      companyAddressError: companyAddressError ?? this.companyAddressError,
      errorCompanyAddressText: errorCompanyAddressText ?? this.errorCompanyAddressText,
      tinError: tinError ?? this.tinError,
      errorTinText: errorTinText ?? this.errorTinText,
      emailError: emailError ?? this.emailError,
      errorEmailText: errorEmailText ?? this.errorEmailText,
      passwordError: passwordError ?? this.passwordError,
      errorPasswordText: errorPasswordText ?? this.errorPasswordText,
      repeatPasswordError: repeatPasswordError ?? this.repeatPasswordError,
      errorRepeatPasswordText: errorRepeatPasswordText ?? this.errorRepeatPasswordText,
    );
  }
}
