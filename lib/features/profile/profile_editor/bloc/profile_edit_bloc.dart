import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart' as aulr;
import 'package:buy_metal_app/data/models/user_models/user_update_user_request.dart';
import 'package:buy_metal_app/data/models/user_models/user_update_user_response.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UserRepository userRepository;
  //final AuthRepository authRepository;
  ProfileEditBloc({
    required this.userRepository,
    //required this.authRepository,
    required PageState pageState,
  }) : super(ProfileEditInitial(pageState)) {
    on<ProfileEditInit>(profileEditInit);
    on<ProfileEditMsgErr>(profileEditMsgErr);
    on<ProfileEditInputFullName>(profileEditInputFullName);
    on<ProfileEditInputCompanyName>(profileEditInputCompanyName);
    on<ProfileEditInputCompanyAddress>(profileEditInputCompanyAddress);
    on<ProfileEditInputTIN>(profileEditInputTIN);
    on<ProfileEditInputPhoneNumber>(profileEditInputPhoneNumber);
    on<ProfileEditInputEmail>(profileEditInputEmail);

    on<ProfileEditSendChangesEvent>(profileEditSendChanges);

    add(ProfileEditInit());
  }

  profileEditInit(ProfileEditInit event, emit) async {
    emit(ProfileEditUp(state.pageState.copyWith(onAwait: true)));
    await Future.delayed(const Duration(milliseconds: 500));
    var user = userRepository.user;
    if (user != null) {
      var model = state.pageState.request.copyWith(
        companyAddress: user.user.companyAddress,
        companyName: user.user.companyName,
        email: user.user.email,
        fullName: user.user.fullName,
        phone: user.user.phone,
        tin: user.user.tin,
      );
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
    var model = state.pageState.request.copyWith(fullName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputCompanyName(ProfileEditInputCompanyName event, emit) async {
    var model = state.pageState.request.copyWith(companyName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputCompanyAddress(ProfileEditInputCompanyAddress event, emit) async {
    var model = state.pageState.request.copyWith(companyAddress: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputTIN(ProfileEditInputTIN event, emit) async {
    var model = state.pageState.request.copyWith(tin: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputPhoneNumber(ProfileEditInputPhoneNumber event, emit) async {
    var model = state.pageState.request.copyWith(phone: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditInputEmail(ProfileEditInputEmail event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  profileEditSendChanges(ProfileEditSendChangesEvent event, emit) async {
    //  String token = userRepository.user?.payload.accessToken ?? '';
    //  String id = userRepository.user?.user.id ?? '';

    //  emit(ProfileEditAllowedToPush(state.pageState.copyWith(response: res)));
    var userId = userRepository.user?.user.id ?? '';
    var token = userRepository.user?.accessToken;

    var response =
        await userRepository.userUpdateUser(request: state.pageState.request, path: userId, accessToken: token);
    // Разобраться как обновить репу
    //await userRepository.setUserData(user:  );

    aulr.User? repositoryUserModel = userRepository.user?.user.copyWith(
        companyAddress: response.companyAddress,
        companyName: response.companyName,
        email: response.email,
        fullName: response.fullName,
        phone: response.phone,
        tin: response.tin);

    await userRepository.setUserData(
        user: userRepository.user?.copyWith(user: repositoryUserModel) ?? const aulr.AuthUploadLoginResponse());

    emit(ProfileEditAllowedToPush(state.pageState.copyWith(response: response)));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileEditMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
