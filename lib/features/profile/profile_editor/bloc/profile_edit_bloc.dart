import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc({
    required PageState pageState,
  }) : super(ProfileEditInitial(pageState)) {
    on<ProfileEditInit>(profile_editInit);
    on<ProfileEditMsgErr>(profile_editMsgErr);
    add(ProfileEditInit());
  }

  profile_editInit(ProfileEditInit event, emit) async {
    emit(ProfileEditUp(state.pageState));
  }

  profile_editMsgErr(ProfileEditMsgErr event, emit) async {
    emit(ProfileEditError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileEditMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
