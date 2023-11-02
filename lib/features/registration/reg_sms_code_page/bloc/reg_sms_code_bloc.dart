import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_sms_code_event.dart';
part 'reg_sms_code_state.dart';

class RegSmsCodeBloc extends Bloc<RegSmsCodeEvent, RegSmsCodeState> {
  RegSmsCodeBloc({
    required PageState pageState,
  }) : super(RegSmsCodeInitial(pageState)) {
    on<RegSmsCodeInit>(regSmsCodeInit);
    on<RegSmsCodeMsgErr>(regSmsCodeMsgErr);
    add(RegSmsCodeInit());
  }

  regSmsCodeInit(RegSmsCodeInit event, emit) async {
    emit(RegSmsCodeUp(state.pageState));
  }

  regSmsCodeMsgErr(RegSmsCodeMsgErr event, emit) async {
    emit(RegSmsCodeError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegSmsCodeMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
