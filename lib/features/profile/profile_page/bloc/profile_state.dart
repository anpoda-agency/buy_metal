// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileState {
  final PageState pageState;
  const ProfileState(this.pageState);
}

class ProfileInitial extends ProfileState {
  const ProfileInitial(PageState pageState) : super(pageState);
}

class ProfileUp extends ProfileState {
  const ProfileUp(PageState pageState) : super(pageState);
}

class ProfileError extends ProfileState {
  const ProfileError(PageState pageState) : super(pageState);
}

class ProfileUpdateUserInfoState extends ProfileState {
  const ProfileUpdateUserInfoState(PageState pageState) : super(pageState);
}

class ProfileLogOutState extends ProfileState {
  const ProfileLogOutState(PageState pageState) : super(pageState);
}

class ProfileGoStatisticState extends ProfileState {
  const ProfileGoStatisticState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final AuthUploadLoginResponse user;
  final String positionRu;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.user = const AuthUploadLoginResponse(),
    this.positionRu = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthUploadLoginResponse? user,
    String? positionRu,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      user: user ?? this.user,
      positionRu: positionRu ?? this.positionRu,
    );
  }
}
