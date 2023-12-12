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
    if (state.pageState.request.rolledType.isNotEmpty) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(rolledTypeError: false)));
    }
  }

  createSimilarProposalInputRolledSize(CreateSimilarProposalInputRolledSizeEvent event, emit) async {
    var model = state.pageState.request.copyWith(rolledSize: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
    if (state.pageState.request.rolledSize.isNotEmpty) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(rolledSizeError: false)));
    }
  }

  createSimilarProposalInputRolledParams(CreateSimilarProposalInputRolledParamsEvent event, emit) async {
    var model = state.pageState.request.copyWith(rolledParams: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
    if (state.pageState.request.rolledParams.isNotEmpty) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(rolledParamsError: false)));
    }
  }

  createSimilarProposalInputRolledGost(CreateSimilarProposalInputRolledGostEvent event, emit) async {
    var model = state.pageState.request.copyWith(rolledGost: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputMaterialBrand(CreateSimilarProposalInputMaterialBrandEvent event, emit) async {
    var model = state.pageState.request.copyWith(materialBrand: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
    if (state.pageState.request.materialBrand.isNotEmpty) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(materialBrandError: false)));
    }
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
    if (state.pageState.request.price > 0) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(priceError: false)));
    }
  }

  createSimilarProposalInputFullPrice(CreateSimilarProposalInputFullPriceEvent event, emit) async {
    var model = state.pageState.request.copyWith(fullPrice: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
  }

  createSimilarProposalInputDeliverDate(CreateSimilarProposalInputDeliverDateEvent event, emit) async {
    var model = state.pageState.request.copyWith(deliverDate: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));
    if (state.pageState.request.deliverDate.length == 10) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(deliverDateError: false)));
    }
  }

  createSimilarProposalInputInStock(CreateSimilarProposalInputInStockEvent event, emit) async {
    var model = state.pageState.request.copyWith(inStock: event.value);
    emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model, isAvailableSelected: true)));
    if (state.pageState.isAvailableSelected) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(availableSelectedError: false)));
    }
  }

  createSimilarProposalSend(CreateSimilarProposalSendEvent event, emit) async {
    if (state.pageState.request.rolledType.isNotEmpty &&
        state.pageState.request.rolledSize.isNotEmpty &&
        state.pageState.request.rolledParams.isNotEmpty &&
        state.pageState.request.materialBrand.isNotEmpty &&
        state.pageState.request.price > 0 &&
        state.pageState.isAvailableSelected) {
      emit(CreateSimilarProposalUpState(state.pageState.copyWith(
        rolledTypeError: false,
        rolledSizeError: false,
        rolledParamsError: false,
        materialBrandError: false,
        priceError: false,
        availableSelectedError: false,
      )));
      if (state.pageState.request.inStock) {
        DateTime now = DateTime.now();

        String creationDate =
            "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
        var model = state.pageState.request.copyWith(creationDate: creationDate);
        emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));

        var token = userRepository.user?.accessToken;

        var response = await applicationResponseRepository.applicationResponseUploadCreate(
            request: state.pageState.request, accessToken: token);
        emit(CreateSimilarProposalAllowedToPushState(state.pageState.copyWith(response: response)));
      } else if (!state.pageState.request.inStock &&
          state.pageState.request.deliverDate.isNotEmpty &&
          state.pageState.request.deliverDate.length == 10) {
        DateTime now = DateTime.now();

        String creationDate =
            "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
        var model = state.pageState.request.copyWith(creationDate: creationDate);
        emit(CreateSimilarProposalUpState(state.pageState.copyWith(request: model)));

        var token = userRepository.user?.accessToken;

        var response = await applicationResponseRepository.applicationResponseUploadCreate(
            request: state.pageState.request, accessToken: token);
        emit(CreateSimilarProposalAllowedToPushState(state.pageState.copyWith(response: response)));
      } else if (state.pageState.request.deliverDate.isEmpty) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: true,
          errorDeliverDateText: 'Введите дату',
        )));
      } else if (state.pageState.request.deliverDate.length < 10 || state.pageState.request.deliverDate.length > 10) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: true,
          errorDeliverDateText: 'Введите корректную дату',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: false,
        )));
      }
    } else {
      if (state.pageState.request.rolledType.isEmpty) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          rolledTypeError: true,
          errorRolledTypeText: 'Введите данные',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          rolledTypeError: false,
        )));
      }
      if (state.pageState.request.rolledSize.isEmpty) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          rolledSizeError: true,
          errorRolledSizeText: 'Введите данные',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          rolledSizeError: false,
        )));
      }
      if (state.pageState.request.rolledParams.isEmpty) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          rolledParamsError: true,
          errorRolledParamsText: 'Введите данные',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          rolledParamsError: false,
        )));
      }
      if (state.pageState.request.materialBrand.isEmpty) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          materialBrandError: true,
          errorMaterialBrandText: 'Введите данные',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          materialBrandError: false,
        )));
      }
      if (state.pageState.request.price <= 0) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          priceError: true,
          errorPriceText: 'Введите стоимость больше 0',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          priceError: false,
        )));
      }
      if (!state.pageState.isAvailableSelected) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          availableSelectedError: true,
          errorAvailableSelectedText: 'Выберите наличие на складе',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          availableSelectedError: false,
        )));
      }
      if (state.pageState.request.inStock) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: false,
        )));
      } else if (state.pageState.request.deliverDate.isEmpty) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: true,
          errorDeliverDateText: 'Введите дату',
        )));
      } else if (state.pageState.request.deliverDate.length < 10 || state.pageState.request.deliverDate.length > 10) {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: true,
          errorDeliverDateText: 'Введите корректную дату',
        )));
      } else {
        emit(CreateSimilarProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: false,
        )));
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateSimilarProposalMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
