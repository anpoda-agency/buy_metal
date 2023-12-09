import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_response.dart';
import 'package:buy_metal_app/data/storage/enum.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/1.7/ui/create_order_page.dart';
import 'package:buy_metal_app/main.dart';
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
    on<CreateOrderInputRolledForm>(createOrderInputRolledForm);
    on<CreateOrderInputRolledType>(createOrderInputRolledType);
    on<CreateOrderInputRolledSize>(createOrderInputRolledSize);
    on<CreateOrderInputRolledParams>(createOrderInputRolledParams);
    on<CreateOrderInputRolledGost>(createOrderInputRolledGost);
    on<CreateOrderInputMaterialBrand>(createOrderInputMaterialBrand);
    on<CreateOrderInputMaterialParams>(createOrderInputMaterialParams);
    on<CreateOrderInputMaterialGost>(createOrderInputMaterialGost);
    on<CreateOrderInputAmount>(createOrderInputAmount);
    on<CreateOrderSend>(createOrderSend);

    add(CreateOrderInit());
  }

  createOrderInit(CreateOrderInit event, emit) async {
    //String creationDate = DateTime.now().toString();

    //var model = applicationRepository;
    // сделать геттер как в QM
    // а может и нет...
    //var user = userRepository;

    //emit(CreateOrderUp(state.pageState.copyWith(request: user)));
    emit(CreateOrderUp(state.pageState));
  }

  createOrderInputRolledForm(CreateOrderInputRolledForm event, emit) async {
    var model = state.pageState.request.copyWith(rolledForm: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputRolledType(CreateOrderInputRolledType event, emit) async {
    var model = state.pageState.request.copyWith(rolledType: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputRolledSize(CreateOrderInputRolledSize event, emit) async {
    var model = state.pageState.request.copyWith(rolledSize: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputRolledParams(CreateOrderInputRolledParams event, emit) async {
    var model = state.pageState.request.copyWith(rolledParams: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputRolledGost(CreateOrderInputRolledGost event, emit) async {
    var model = state.pageState.request.copyWith(rolledGost: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputMaterialBrand(CreateOrderInputMaterialBrand event, emit) async {
    var model = state.pageState.request.copyWith(materialBrand: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputMaterialParams(CreateOrderInputMaterialParams event, emit) async {
    var model = state.pageState.request.copyWith(materialParams: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputMaterialGost(CreateOrderInputMaterialGost event, emit) async {
    var model = state.pageState.request.copyWith(materialGost: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderInputAmount(CreateOrderInputAmount event, emit) async {
    var model = state.pageState.request.copyWith(amount: event.value);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));
  }

  createOrderSend(CreateOrderSend event, emit) async {
    DateTime now = DateTime.now();

    String creationDate =
        "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    //String dateForSed = DateTime.now().toString();
    //"${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}T${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}.${now.microsecond.toString().padLeft(3, '0')}Z";
    //DateTime.now().toString();

    var userId = userRepository.user?.user.id;

    var token = userRepository.user?.accessToken;

    var model = state.pageState.request.copyWith(creationDate: creationDate, userId: userId);
    emit(CreateOrderUp(state.pageState.copyWith(request: model)));

    var res = await applicationRepository.applicationUploadCreateApplication(
        request: state.pageState.request, accessToken: token);

    globalStream.add(GlobalEvents.createOrder);
    emit(CreateOrderAllowedToPush(state.pageState.copyWith(response: res)));
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
