import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_request.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_response.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_similar_proposal_event.dart';
part 'create_similar_proposal_state.dart';

class CreateSimilarProposalBloc extends Bloc<CreateSimilarProposalEvent, CreateSimilarProposalState> {
  final ApplicationUploadSearchResponse applicationProposalResponse;
  final UserRepository userRepository;
  final ApplicationResponseRepository applicationResponseRepository;
  CreateSimilarProposalBloc({
    required this.applicationProposalResponse,
    required this.userRepository,
    required this.applicationResponseRepository,
    required PageState pageState,
  }) : super(CreateSimilarProposalInitialState(pageState)) {
    on<CreateSimilarProposalInitEvent>(createSimilarProposalInit);
    on<CreateSimilarProposalMsgErrEvent>(createSimilarProposalMsgErr);
    on<CreateSimilarProposalInputRolledTypeEvent>(createSimilarProposalInputRolledType);
    on<CreateSimilarProposalInputRolledSizeEvent>(createSimilarProposalInputRolledSize);
    on<CreateSimilarProposalInputRolledParamsEvent>(createSimilarProposalInputRolledParams);
    on<CreateSimilarProposalInputRolledGostEvent>(createSimilarProposalInputRolledGost);
    on<CreateSimilarProposalInputMaterialBrandEvent>(createSimilarProposalInputMaterialBrand);
    on<CreateSimilarProposalInputMaterialParamsEvent>(createSimilarProposalInputMaterialParams);
    on<CreateSimilarProposalInputMaterialGostEvent>(createSimilarProposalInputMaterialGost);
    on<CreateSimilarProposalInputPriceEvent>(createSimilarProposalInputPrice);
    on<CreateSimilarProposalInputFullPriceEvent>(createSimilarProposalInputFullPrice);
    on<CreateSimilarProposalInputDeliverDateEvent>(createSimilarProposalInputDeliverDate);
    on<CreateSimilarProposalInputInStockEvent>(createSimilarProposalInputInStock);
    on<CreateSimilarProposalSendEvent>(createSimilarProposalSend);
    add(CreateSimilarProposalInitEvent());
  }

  createSimilarProposalInit(CreateSimilarProposalInitEvent event, emit) async {
    var model = state.pageState.request.copyWith(
      amount: applicationProposalResponse.amount,
      applicationId: applicationProposalResponse.id,
      rolledForm: applicationProposalResponse.rolledForm,
      similar: false,
      userID: userRepository.user?.user.id,
    );

    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalMsgErr(CreateSimilarProposalMsgErrEvent event, emit) async {
    emit(CreateSimilarProposalErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  createSimilarProposalInputRolledType(CreateSimilarProposalInputRolledTypeEvent event, emit) async {
    var model = state.pageState.request.copyWith(rolledType: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputRolledSize(CreateSimilarProposalInputRolledSizeEvent event, emit) async {
    var model = state.pageState.request.copyWith(rolledSize: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputRolledParams(CreateSimilarProposalInputRolledParamsEvent event, emit) async {
    var model = state.pageState.request.copyWith(rolledParams: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputRolledGost(CreateSimilarProposalInputRolledGostEvent event, emit) async {
    var model = state.pageState.request.copyWith(rolledGost: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputMaterialBrand(CreateSimilarProposalInputMaterialBrandEvent event, emit) async {
    var model = state.pageState.request.copyWith(materialBrand: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputMaterialParams(CreateSimilarProposalInputMaterialParamsEvent event, emit) async {
    var model = state.pageState.request.copyWith(materialParams: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputMaterialGost(CreateSimilarProposalInputMaterialGostEvent event, emit) async {
    var model = state.pageState.request.copyWith(materialGost: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputPrice(CreateSimilarProposalInputPriceEvent event, emit) async {
    var model = state.pageState.request.copyWith(price: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputFullPrice(CreateSimilarProposalInputFullPriceEvent event, emit) async {
    var model = state.pageState.request.copyWith(fullPrice: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputDeliverDate(CreateSimilarProposalInputDeliverDateEvent event, emit) async {
    var model = state.pageState.request.copyWith(deliverDate: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputInStock(CreateSimilarProposalInputInStockEvent event, emit) async {
    var model = state.pageState.request.copyWith(inStock: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalSend(CreateSimilarProposalSendEvent event, emit) async {
    DateTime now = DateTime.now();

    String creationDate =
        "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    var model = state.pageState.request.copyWith(creationDate: creationDate);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));

    var token = userRepository.user?.accessToken;

    var response = await applicationResponseRepository.applicationResponseUploadCreate(
        request: state.pageState.request, accessToken: token);
    emit(CreateSimilarProposalAllowedToPushState(state.pageState.copyWith(response: response)));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateSimilarProposalMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
