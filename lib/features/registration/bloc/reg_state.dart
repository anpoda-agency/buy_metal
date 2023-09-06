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

  const PageState({
    this.request = const AuthUploadRegisterNewUserRequest(),
    this.response = const AuthUploadRegisterNewUserResponse(),
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthUploadRegisterNewUserRequest? request,
    AuthUploadRegisterNewUserResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
