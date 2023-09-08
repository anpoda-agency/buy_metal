import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final ApplicationRepository applicationRepository;
  final UserRepository userRepository;
  CreateOrderBloc({
    required this.applicationRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(CreateOrderInitial(pageState)) {
    on<CreateOrderInit>(createOrderInit);
    on<CreateOrderMsgErr>(createOrderMsgErr);
    add(CreateOrderInit());
  }

  createOrderInit(CreateOrderInit event, emit) async {
    emit(CreateOrderUp(state.pageState));
  }

  createOrderMsgErr(CreateOrderMsgErr event, emit) async {
    emit(CreateOrderError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateOrderMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
