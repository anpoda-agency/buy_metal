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
  final String phoneNumber;
  RegBloc({
    required this.authRepository,
    required this.userRepository,
    required this.phoneNumber,
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
    on<RegInputRepeatPassword>(regInputRepeatPassword);
    on<RegSendReg>(regSendReg);
    add(RegInit());
  }

  regInit(RegInit event, emit) async {
    var model = state.pageState.request.copyWith(phone: phoneNumber);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputPosition(RegInputPosition event, emit) async {
    var model = state.pageState.request.copyWith(position: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.position.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(typeProfileError: false)));
    }
  }

  regInputFullName(RegInputFullName event, emit) async {
    var model = state.pageState.request.copyWith(fullName: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.fullName.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(fullNameError: false)));
    }
  }

  regInputCompanyName(RegInputCompanyName event, emit) async {
    var model = state.pageState.request.copyWith(companyName: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.companyName.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(companyNameError: false)));
    }
  }

  regInputCompanyAddress(RegInputCompanyAddress event, emit) async {
    var model = state.pageState.request.copyWith(companyAddress: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.companyAddress.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(companyAddressError: false)));
    }
  }

  regInputTIN(RegInputTIN event, emit) async {
    var model = state.pageState.request.copyWith(tin: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.tin.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(tinError: false)));
    }
  }

  regInputPhoneNumber(RegInputPhoneNumber event, emit) async {
    var model = state.pageState.request.copyWith(phone: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
  }

  regInputEmail(RegInputEmail event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.email.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(emailError: false)));
    }
  }

  regInputPassword(RegInputPassword event, emit) async {
    var model = state.pageState.request.copyWith(password: event.value);
    emit(RegUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.password.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(passwordError: false)));
    }
  }

  regInputRepeatPassword(RegInputRepeatPassword event, emit) async {
    //var model = state.pageState.copyWith(repeatPassword: event.value);
    emit(RegUp(state.pageState.copyWith(repeatPassword: event.value)));
    if (state.pageState.repeatPassword.isNotEmpty) {
      emit(RegUp(state.pageState.copyWith(repeatPasswordError: false)));
    }
  }

  regSendReg(RegSendReg event, emit) async {
    if (state.pageState.request.position.isNotEmpty &&
        state.pageState.request.fullName.isNotEmpty &&
        state.pageState.request.companyName.isNotEmpty &&
        state.pageState.request.companyAddress.isNotEmpty &&
        state.pageState.request.tin.isNotEmpty &&
        state.pageState.request.phone.isNotEmpty &&
        state.pageState.request.email.isNotEmpty &&
        state.pageState.request.password.isNotEmpty &&
        state.pageState.request.password == state.pageState.repeatPassword &&
        state.pageState.request.password.length >= 8 &&
        state.pageState.request.tin.length >= 9 &&
        state.pageState.request.tin.length <= 11) {
      if (state.pageState.request.position == 'SUPPLIER') {
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
      }
      emit(RegAllowedToPush(state.pageState));
    } else {
      if (state.pageState.request.position.isEmpty) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          typeProfileError: true,
          errorTypeProfileText: 'Выберите тип аккаунта',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          typeProfileError: false,
        )));
      }
      if (state.pageState.request.fullName.isEmpty) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          fullNameError: true,
          errorFullNameText: 'Введите ваши данные',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          fullNameError: false,
        )));
      }
      if (state.pageState.request.companyName.isEmpty) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          companyNameError: true,
          errorCompanyNameText: 'Введите ваши данные',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          companyNameError: false,
        )));
      }
      if (state.pageState.request.companyAddress.isEmpty) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          companyAddressError: true,
          errorCompanyAddressText: 'Введите ваши данные',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          companyAddressError: false,
        )));
      }
      if (state.pageState.request.tin.isEmpty) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          tinError: true,
          errorTinText: 'Введите ваши данные',
        )));
      } else if (state.pageState.request.tin.length < 9 || state.pageState.request.tin.length > 11) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          tinError: true,
          errorTinText: 'Введите значение ИНН от 9 до 11 цифр',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          tinError: false,
        )));
      }
      if (state.pageState.request.email.isEmpty) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          emailError: true,
          errorEmailText: 'Введите ваши данные',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          emailError: false,
        )));
      }
      if (state.pageState.request.password.isEmpty) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          passwordError: true,
          errorPasswordText: 'Введите пароль',
        )));
      } else if (state.pageState.request.password.length < 8) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          passwordError: true,
          errorPasswordText: 'Пароль должен состоять из не менее 8 символов',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          passwordError: false,
        )));
      }
      if (state.pageState.repeatPassword != state.pageState.request.password) {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          repeatPasswordError: true,
          errorRepeatPasswordText: 'Пароли не совпадают',
        )));
      } else {
        emit(RegInputErrorState(state.pageState.copyWith(
          onAwait: false,
          repeatPasswordError: false,
        )));
      }
    }
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
