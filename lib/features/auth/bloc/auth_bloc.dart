import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  AuthBloc({
    required this.authRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(AuthInitial(pageState)) {
    on<AuthInit>(authInit);
    on<AuthMsgErr>(authMsgErr);
    on<AuthInputEmail>(authInputEmail);
    on<AuthInputPassword>(authInputPassword);
    on<AuthSendLogin>(authSendLogin);
    add(AuthInit());
  }

  authInit(AuthInit event, emit) async {
    emit(AuthUp(state.pageState));
  }

  authInputEmail(AuthInputEmail event, emit) async {
    var model = state.pageState.request.copyWith(email: event.value);
    emit(AuthUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.email.isNotEmpty) {
      emit(AuthUp(state.pageState.copyWith(emailError: false, passwordError: false)));
    }
  }

  authInputPassword(AuthInputPassword event, emit) async {
    var model = state.pageState.request.copyWith(password: event.value);
    emit(AuthUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.password.isNotEmpty) {
      emit(AuthUp(state.pageState.copyWith(emailError: false, passwordError: false)));
    }
  }

  authSendLogin(AuthSendLogin event, emit) async {
    if (state.pageState.request.email.isNotEmpty && state.pageState.request.password.isNotEmpty) {
      var res = await authRepository.authUploadLogin(request: state.pageState.request);

      await userRepository.setUserData(user: res, token: res.refreshToken);
      authRepository.changeAuthStatus(val: true);
      emit(AuthAllowedToPush(state.pageState.copyWith(response: res)));
    } else {
      //emit(AuthError(state.pageState));
      if (state.pageState.request.email.isEmpty) {
        emit(AuthInputErrorState(state.pageState.copyWith(
          onAwait: false,
          emailError: true,
          errorEmailText: 'Введите вашу электронную почту',
        )));
      } else {
        emit(AuthInputErrorState(state.pageState.copyWith(
          onAwait: false,
          emailError: false,
        )));
      }
      if (state.pageState.request.password.isEmpty) {
        emit(AuthInputErrorState(state.pageState.copyWith(
          onAwait: false,
          passwordError: true,
          errorPasswordText: 'Введите ваш пароль',
        )));
      } else {
        emit(AuthInputErrorState(state.pageState.copyWith(
          onAwait: false,
          passwordError: false,
        )));
      }
    }
  }

  authMsgErr(AuthMsgErr event, emit) async {
    emit(AuthError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
      emailError: true,
      passwordError: true,
      errorEmailText: 'Неверные учетные данные',
      errorPasswordText: 'Неверные учетные данные',
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
