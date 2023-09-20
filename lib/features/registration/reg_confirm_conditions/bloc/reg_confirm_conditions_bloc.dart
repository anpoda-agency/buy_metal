import 'package:flutter_bloc/flutter_bloc.dart';

part 'reg_confirm_conditions_event.dart';
part 'reg_confirm_conditions_state.dart';

class RegConfirmConditionsBloc extends Bloc<RegConfirmConditionsEvent, RegConfirmConditionsState> {
  RegConfirmConditionsBloc({
    required PageState pageState,
  }) : super(RegConfirmConditionsInitialState(pageState)) {
    on<RegConfirmConditionsInitEvent>(regConfirmConditionsInit);
    on<RegConfirmConditionsMsgErrEvent>(regConfirmConditionsMsgErr);
    add(RegConfirmConditionsInitEvent());
  }

  regConfirmConditionsInit(RegConfirmConditionsInitEvent event, emit) async {
    emit(RegConfirmConditionsUpState(state.pageState));
  }

  regConfirmConditionsMsgErr(RegConfirmConditionsMsgErrEvent event, emit) async {
    emit(RegConfirmConditionsErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegConfirmConditionsMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
