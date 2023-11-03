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
    on<RegSmsCodeInputCodeEvent>(regSmsCodeInputCode);
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

  regSmsCodeInputCode(RegSmsCodeInputCodeEvent event, emit) {
    //
    emit(RegSmsCodeUp(state.pageState));
  }

  regSmsCodeSendCode(RegSmsCodeSendCodeEvent event, emit) {
    //
    emit(RegSmsCodeAllowedToPush(state.pageState));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegSmsCodeMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
