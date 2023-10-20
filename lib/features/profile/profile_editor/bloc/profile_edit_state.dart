// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_edit_bloc.dart';

abstract class ProfileEditState {
  final PageState pageState;
  const ProfileEditState(this.pageState);
}

class ProfileEditInitial extends ProfileEditState {
  const ProfileEditInitial(PageState pageState) : super(pageState);
}

class ProfileEditUp extends ProfileEditState {
  const ProfileEditUp(PageState pageState) : super(pageState);
}

class ProfileEditError extends ProfileEditState {
  const ProfileEditError(PageState pageState) : super(pageState);
}

class ProfileEditAllowedToPush extends ProfileEditState {
  const ProfileEditAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final UserUpdateUserRequest request;
  final UserUpdateUserResponse response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const UserUpdateUserRequest(),
    this.response = const UserUpdateUserResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    UserUpdateUserRequest? request,
    UserUpdateUserResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
