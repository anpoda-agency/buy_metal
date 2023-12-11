// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState {
  final PageState pageState;
  const AuthState(this.pageState);
}

class AuthInitial extends AuthState {
  const AuthInitial(PageState pageState) : super(pageState);
}

class AuthUp extends AuthState {
  const AuthUp(PageState pageState) : super(pageState);
}

class AuthInputErrorState extends AuthState {
  const AuthInputErrorState(PageState pageState) : super(pageState);
}

class AuthError extends AuthState {
  const AuthError(PageState pageState) : super(pageState);
}

class AuthAllowedToPush extends AuthState {
  const AuthAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final AuthUploadLoginRequest request;
  final AuthUploadLoginResponse response;

  final bool emailError;
  final bool passwordError;
  final String errorText;
  final String errorEmailText;
  final String errorPasswordText;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const AuthUploadLoginRequest(),
    this.response = const AuthUploadLoginResponse(),
    this.emailError = false,
    this.passwordError = false,
    this.errorText = '',
    this.errorEmailText = '',
    this.errorPasswordText = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthUploadLoginRequest? request,
    AuthUploadLoginResponse? response,
    bool? emailError,
    bool? passwordError,
    String? errorText,
    String? errorEmailText,
    String? errorPasswordText,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      errorText: errorText ?? this.errorText,
      errorEmailText: errorEmailText ?? this.errorEmailText,
      errorPasswordText: errorPasswordText ?? this.errorPasswordText,
    );
  }
}
