import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_phone_event.dart';
part 'reg_phone_state.dart';

class RegPhoneBloc extends Bloc<RegPhoneEvent, RegPhoneState> {
  RegPhoneBloc({
    required PageState pageState,
  }) : super(RegPhoneInitial(pageState)) {
    on<RegPhoneInit>(regPhoneInit);
    on<RegPhoneMsgErr>(regPhoneMsgErr);
    add(RegPhoneInit());
  }

  regPhoneInit(RegPhoneInit event, emit) async {
    emit(RegPhoneUp(state.pageState));
  }

  regPhoneMsgErr(RegPhoneMsgErr event, emit) async {
    emit(RegPhoneError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegPhoneMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
