import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_confirm_number_request.dart';
import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_confirm_number_response.dart';
import 'package:buy_metal_app/domain/repository/activation_code_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_sms_code_event.dart';
part 'reg_sms_code_state.dart';

class RegSmsCodeBloc extends Bloc<RegSmsCodeEvent, RegSmsCodeState> {
  final String phoneNumber;
  final ActivationCodeRepository activationCodeRepository;
  RegSmsCodeBloc({
    required this.phoneNumber,
    required this.activationCodeRepository,
    required PageState pageState,
  }) : super(RegSmsCodeInitial(pageState)) {
    on<RegSmsCodeInit>(regSmsCodeInit);
    on<RegSmsCodeMsgErr>(regSmsCodeMsgErr);
    on<RegSmsCodeInputValueEvent>(regSmsCodeInputValue);
    on<RegSmsCodeSendCodeEvent>(regSmsCodeSendCode);
    add(RegSmsCodeInit());
  }

  regSmsCodeInit(RegSmsCodeInit event, emit) async {
    var model = state.pageState.request.copyWith(
      verificationStep: "REGISTRATION",
      verificationType: "PHONE",
      source: phoneNumber,
    );
    emit(RegSmsCodeUp(state.pageState.copyWith(request: model)));
  }

  regSmsCodeMsgErr(RegSmsCodeMsgErr event, emit) async {
    emit(RegSmsCodeError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  regSmsCodeInputValue(RegSmsCodeInputValueEvent event, emit) async {
    //
    var model = state.pageState.request.copyWith(code: event.value);
    emit(RegSmsCodeUp(state.pageState.copyWith(request: model, errMsg: '')));
    if (state.pageState.request.code.length == 4) {
      emit(RegSmsCodeUp(state.pageState.copyWith(smsCodeError: false)));
    }
    //event.completed ? add(RegSmsCodeSendCodeEvent()) : null;
  }

  regSmsCodeSendCode(RegSmsCodeSendCodeEvent event, emit) async {
    if (state.pageState.request.code.isNotEmpty && state.pageState.request.code.length == 4) {
      emit(RegSmsCodeUp(state.pageState.copyWith(smsCodeError: false)));
      var res = await activationCodeRepository.activationCodeUploadConfirmNumber(request: state.pageState.request);
      if (!res.success) {
        if (res.message == 'Code not verified') {
          emit(RegSmsCodeError(state.pageState.copyWith(
            onAwait: false,
            errMsg: 'Неверный код',
          )));
          emit(RegSmsCodeInpurErrorState(state.pageState.copyWith(
            onAwait: false,
            smsCodeError: true,
            errorText: 'Введите правильный смс код',
          )));
        } else {
          emit(RegSmsCodeError(state.pageState.copyWith(onAwait: false, errMsg: res.message)));
        }
      } else {
        emit(RegSmsCodeAllowedToPush(state.pageState));
      }
    } else {
      if (state.pageState.request.code.isEmpty) {
        emit(RegSmsCodeInpurErrorState(state.pageState.copyWith(
          onAwait: false,
          smsCodeError: true,
          errorText: 'Введите смс код',
        )));
      } else if (state.pageState.request.source.length != 4) {
        emit(RegSmsCodeInpurErrorState(state.pageState.copyWith(
          onAwait: false,
          smsCodeError: true,
          errorText: 'Введите правильный смс код',
        )));
      } else {
        emit(RegSmsCodeInpurErrorState(state.pageState.copyWith(
          onAwait: false,
          smsCodeError: false,
        )));
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegSmsCodeMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
