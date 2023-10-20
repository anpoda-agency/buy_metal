import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart' as aulr;
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_response.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_confirm_conditions_event.dart';
part 'reg_confirm_conditions_state.dart';

class RegConfirmConditionsBloc extends Bloc<RegConfirmConditionsEvent, RegConfirmConditionsState> {
  final AuthUploadRegisterNewUserRequest userRegInfoRequest;
  final AuthRepository authRepository;
  final UserRepository userRepository;
  RegConfirmConditionsBloc({
    required this.userRegInfoRequest,
    required this.authRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(RegConfirmConditionsInitialState(pageState)) {
    on<RegConfirmConditionsInitEvent>(regConfirmConditionsInit);
    on<RegConfirmConditionsMsgErrEvent>(regConfirmConditionsMsgErr);
    on<RegConfirmConditionSendRegEvent>(regConfirmConditionSendReg);
    add(RegConfirmConditionsInitEvent());
  }

  regConfirmConditionsInit(RegConfirmConditionsInitEvent event, emit) async {
    emit(RegConfirmConditionsUpState(state.pageState));
  }

  regConfirmConditionsMsgErr(RegConfirmConditionsMsgErrEvent event, emit) async {
    emit(RegConfirmConditionsErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  regConfirmConditionSendReg(RegConfirmConditionSendRegEvent event, emit) async {
    var res = await authRepository.authUploadRegisterNewUser(request: userRegInfoRequest);

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
    emit(RegConfirmConditionsAllowedToPushState(state.pageState.copyWith(response: res)));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegConfirmConditionsMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
