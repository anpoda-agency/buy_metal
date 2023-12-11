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
      //proneError: true,
      //errorText: 'Указан неверный номер телефона'
    )));
  }

  regPhoneInputNumber(RegPhoneInputNumberEvent event, emit) async {
    var model = state.pageState.request.copyWith(source: event.value);
    emit(RegPhoneUp(state.pageState.copyWith(request: model)));
  }

  regPhoneSendRequest(RegPhoneSendRequestEvent event, emit) async {
    if (state.pageState.request.source.isNotEmpty && state.pageState.request.source.length == 11) {
      emit(RegPhoneUp(state.pageState.copyWith(proneError: false)));
      var res = await activationCodeRepository.activationCodeUploadSendActivationCode(request: state.pageState.request);
      if (!res.success) {
        emit(RegPhoneError(state.pageState.copyWith(
          onAwait: false,
          errMsg: res.message,
        )));
      }
      emit(RegPhoneAllowedToPush(state.pageState.copyWith(response: res, proneError: false)));
    } else {
      //emit(RegPhoneError(state.pageState));
      if (state.pageState.request.source.isEmpty) {
        emit(RegPhoneInputErrorState(state.pageState.copyWith(
          onAwait: false,
          proneError: true,
          errorText: 'Введите ваш номер телефона',
        )));
      } else
      /* {
        emit(RegPhoneError(state.pageState.copyWith(
          onAwait: false,
          proneError: false,
        )));
      } */
      if (state.pageState.request.source.length != 11) {
        emit(RegPhoneInputErrorState(state.pageState.copyWith(
          onAwait: false,
          proneError: true,
          errorText: 'Введите корректный номер телефона',
        )));
      } else {
        emit(RegPhoneInputErrorState(state.pageState.copyWith(
          onAwait: false,
          proneError: false,
        )));
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegPhoneMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
