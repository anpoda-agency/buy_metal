import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({
    required this.authRepository,
    required PageState pageState,
  }) : super(AuthInitial(pageState)) {
    on<AuthInit>(authInit);
    on<AuthMsgErr>(authMsgErr);
    add(AuthInit());
  }

  authInit(AuthInit event, emit) async {
    emit(AuthUp(state.pageState));
  }

  authMsgErr(AuthMsgErr event, emit) async {
    emit(AuthError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
