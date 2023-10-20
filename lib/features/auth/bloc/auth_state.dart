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

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const AuthUploadLoginRequest(),
    this.response = const AuthUploadLoginResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthUploadLoginRequest? request,
    AuthUploadLoginResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
