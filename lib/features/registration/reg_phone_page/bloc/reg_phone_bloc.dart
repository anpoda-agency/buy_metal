import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_send_activation_code_request.dart';
import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_send_activation_code_response.dart';
import 'package:buy_metal_app/domain/repository/activation_code_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_phone_event.dart';
part 'reg_phone_state.dart';

class RegPhoneBloc extends Bloc<RegPhoneEvent, RegPhoneState> {
  final ActivationCodeRepository activationCodeRepository;
  RegPhoneBloc({
    required this.activationCodeRepository,
    required PageState pageState,
  }) : super(RegPhoneInitial(pageState)) {
    on<RegPhoneInit>(regPhoneInit);
    on<RegPhoneMsgErr>(regPhoneMsgErr);
    on<RegPhoneInputNumberEvent>(regPhoneInputNumber);
    on<RegPhoneSendRequestEvent>(regPhoneSendRequest);
    add(RegPhoneInit());
  }

  regPhoneInit(RegPhoneInit event, emit) async {
    var model = state.pageState.request.copyWith(
      verificationStep: "REGISTRATION",
      verificationType: "PHONE",
    );
    emit(RegPhoneUp(state.pageState.copyWith(request: model)));
  }

  regPhoneMsgErr(RegPhoneMsgErr event, emit) async {
    emit(RegPhoneError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  regPhoneInputNumber(RegPhoneInputNumberEvent event, emit) async {
    var model = state.pageState.request.copyWith(source: event.value);
    emit(RegPhoneUp(state.pageState.copyWith(request: model)));
  }

  regPhoneSendRequest(RegPhoneSendRequestEvent event, emit) async {
    var res = await activationCodeRepository.activationCodeUploadSendActivationCode(request: state.pageState.request);
    if (!res.success) {
      emit(RegPhoneError(state.pageState.copyWith(
        onAwait: false,
        errMsg: res.message,
      )));
    }
    emit(RegPhoneAllowedToPush(state.pageState.copyWith(response: res)));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegPhoneMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
