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
