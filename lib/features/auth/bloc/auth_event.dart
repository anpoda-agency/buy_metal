part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthInit extends AuthEvent {}

class AuthMsgErr extends AuthEvent {
  final String msg;
  AuthMsgErr(this.msg);
}

class AuthInputEmail extends AuthEvent {
  final String value;
  AuthInputEmail(this.value);
}

class AuthInputPassword extends AuthEvent {
  final String value;
  AuthInputPassword(this.value);
}

class AuthSendLogin extends AuthEvent {}
