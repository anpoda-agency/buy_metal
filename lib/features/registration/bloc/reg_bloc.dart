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
    add(RegInit());
  }

  regInit(RegInit event, emit) async {
    emit(RegUp(state.pageState));
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
