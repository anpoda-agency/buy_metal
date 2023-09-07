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
