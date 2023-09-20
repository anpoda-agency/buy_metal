import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart' as aulr;
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_response.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_event.dart';
part 'reg_state.dart';

class RegBloc extends Bloc<RegEvent, RegState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  RegBloc({
    required this.authRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(RegInitial(pageState)) {
    on<RegInit>(regInit);
    on<RegMsgErr>(regMsgErr);
    on<RegInputPosition>(regInputPosition);
    on<RegInputFullName>(regInputFullName);
    on<RegInputCompanyName>(regInputCompanyName);
    on<RegInputCompanyAddress>(regInputCompanyAddress);
    on<RegInputTIN>(regInputTIN);
    on<RegInputPhoneNumber>(regInputPhoneNumber);
    on<RegInputEmail>(regInputEmail);
    on<RegInputPassword>(regInputPassword);
    on<RegSendReg>(regSendReg);
    add(RegInit());
  }

  regInit(RegInit event, emit) async {
    emit(RegUp(state.pageState));
  }

  regInputPosition(RegInputPosition event, emit) async {
    var model = state.pageState.request.copyWith(position: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputFullName(RegInputFullName event, emit) async {
    var model = state.pageState.request.copyWith(fullName: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputCompanyName(RegInputCompanyName event, emit) async {
    var model = state.pageState.request.copyWith(companyName: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputCompanyAddress(RegInputCompanyAddress event, emit) async {
    var model = state.pageState.request.copyWith(companyAddress: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputTIN(RegInputTIN event, emit) async {
    var model = state.pageState.request.copyWith(tin: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputPhoneNumber(RegInputPhoneNumber event, emit) async {
    var model = state.pageState.request.copyWith(phone: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputEmail(RegInputEmail event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputPassword(RegInputPassword event, emit) async {
    var model = state.pageState.request.copyWith(password: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regSendReg(RegSendReg event, emit) async {
    var res = await authRepository.authUploadRegisterNewUser(request: state.pageState.request);

    await userRepository.setUserData(
        user: const aulr
            .AuthUploadLoginResponse()); // ДЕЛАЮ ИНИЦИАЛИЗАЦИЮ ПЕРЕМЕННОЙ _user КОТОРАЯ ЭКЗЕМПЛЯР КЛАССА МОДЕЛИ AuthUploadLoginResponse
    // ЧТОБЫ ГЕТТЕР ВОЗВРАЩАЛ МНЕ ПУСТУЮ МОДЕЛЬ, А НЕ NULL
    aulr.User? repositoryUserModel = userRepository.user?.user.copyWith(
      blocked: res.user.blocked,
      companyAddress: res.user.companyAddress,
      companyName: res.user.companyName,
      email: res.user.email,
      fullName: res.user.fullName,
      id: res.user.id,
      mailConfirmed: res.user.mailConfirmed,
      phone: res.user.phone,
      position: res.user.position,
      registrationDate: res.user.registrationDate,
      tin: res.user.tin,
      //refresh: res.user.refresh
    );

    AuthUploadLoginResponse? repositoryUserLoginResponseModel = userRepository.user?.copyWith(
      accessToken: res.accessToken,
      refreshToken: res.refreshToken,
      user: repositoryUserModel,
    );

/*
    await userRepository.setUserData(
        user: userRepository.user
                ?.copyWith(user: repositoryUserModel, accessToken: res.accessToken, refreshToken: res.refreshToken) ??
            const aulr.AuthUploadLoginResponse());
            */

    await userRepository.setUserData(
        user: repositoryUserLoginResponseModel ?? const aulr.AuthUploadLoginResponse(),
        token: res.refreshToken); // res.refreshToken / repositoryUserLoginResponseModel?.refreshToken

    authRepository.changeAuthStatus(val: true);
    emit(RegAllowedToPush(state.pageState.copyWith(response: res)));
  }

  regMsgErr(RegMsgErr event, emit) async {
    emit(RegError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
