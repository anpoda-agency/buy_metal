import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  ProfileEditBloc({
    required this.userRepository,
    required this.authRepository,
    required PageState pageState,
  }) : super(ProfileEditInitial(pageState)) {
/*
    on<ProfileEditInit>(profileEditInit);
    on<ProfileEditMsgErr>(profileEditMsgErr);
    on<ProfileEditInputFullName>(profileEditInputFullName);
    on<ProfileEditInputCompanyName>(profileEditInputCompanyName);
    on<ProfileEditInputCompanyAddress>(profileEditInputCompanyAddress);
    on<ProfileEditInputTIN>(profileEditInputTIN);
    on<ProfileEditInputPhoneNumber>(profileEditInputPhoneNumber);
    on<ProfileEditInputEmail>(profileEditInputEmail);
    
    on<ProfileEditSendChanges>(profileEditSendChanges);
*/
    add(ProfileEditInit());
  }

/*
  profileEditInit(ProfileEditInit event, emit) async {
    emit(ProfileEditUp(state.pageState.copyWith(onAwait: true)));
    await Future.delayed(const Duration(milliseconds: 500));
    var user = userRepository.user;
    if (user != null) {
      var model = state.pageState.request.copyWith();
      emit(ProfileEditUp(state.pageState.copyWith(request: model)));
    }
    emit(ProfileEditUp(state.pageState.copyWith(onAwait: false)));
  }

  profileEditMsgErr(ProfileEditMsgErr event, emit) async {
    emit(ProfileEditError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  profileEditInputFullName(ProfileEditInputFullName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputCompanyName(ProfileEditInputCompanyName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputCompanyAddress(ProfileEditInputCompanyAddress event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputTIN(ProfileEditInputTIN event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputPhoneNumber(ProfileEditInputPhoneNumber event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputEmail(ProfileEditInputEmail event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  

  profileEditSendChanges(ProfileEditSendChanges event, emit) async {
    String token = userRepository.user?.payload.accessToken ?? '';
    String id = userRepository.user?.user.id ?? '';

    emit(ProfileEditAllowedToPush(state.pageState.copyWith(response: res)));
  }
*/

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileEditMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
