import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_response.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_event.dart';
part 'reg_state.dart';

class RegBloc extends Bloc<RegEvent, RegState> {
  final AuthRepository authRepository;
  RegBloc({
    required this.authRepository,
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
    on<RegSend>(regSend);
    add(RegInit());
  }

  regInit(RegInit event, emit) async {
    emit(RegUp(state.pageState));
  }

  regInputPosition(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regInputFullName(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regInputCompanyName(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regInputCompanyAddress(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regInputTIN(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regInputPhoneNumber(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regInputEmail(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regInputPassword(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
  }

  regSend(ProfileEditInputName event, emit) async {
    var model = state.pageState.request.copyWith(firstName: event.value);
    emit(ProfileEditUp(state.pageState.copyWith(request: model)));
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
