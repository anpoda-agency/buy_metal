import 'package:buy_metal_app/data/models/application_response_models/application_response_get_supplier_responses_response.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_proposals_event.dart';
part 'supplier_proposals_state.dart';

class SupplierProposalsBloc extends Bloc<SupplierProposalsEvent, SupplierProposalsState> {
  final UserRepository userRepository;
  final ApplicationResponseRepository applicationResponseRepository;
  SupplierProposalsBloc({
    required this.userRepository,
    required this.applicationResponseRepository,
    required PageState pageState,
  }) : super(SupplierProposalsInitial(pageState)) {
    on<SupplierProposalsInit>(supplierProposalsInit);
    on<SupplierProposalsMsgErr>(supplierProposalsMsgErr);
    on<SupplierProposalsChooseProposalEvent>(supplierProposalsChooseProposal);
    add(SupplierProposalsInit());
  }

  supplierProposalsInit(SupplierProposalsInit event, emit) async {
    //emit(SuppliersProposalsListUp(state.pageState.copyWith(onAwait: true)));

    var accessToken = userRepository.user?.accessToken;

    var supplierId = userRepository.user?.user.id ?? '';
    //var res =
    //    await applicationRepository.applicationGetResponsesByApplicationId(path: applicationId, accessToken: token);
    var res = await applicationResponseRepository.applicationResponseGetSupplierResponses(
      path: supplierId,
      accessToken: accessToken,
    );
    //emit(SuppliersProposalsListUp(state.pageState.copyWith(response: res, onAwait: false)));

    emit(SupplierProposalsUp(state.pageState.copyWith(response: res)));
  }

  supplierProposalsChooseProposal(SupplierProposalsChooseProposalEvent event, emit) async {
    //var model = userRepository.user;
    //var model = state.pageState.copyWith(proposalById: event.proposalById);

    //emit(SupplierProposalsChooseProposalState(state.pageState.copyWith(proposalById: event.proposalById)));

    emit(SupplierProposalsChooseProposalState(state.pageState.copyWith(proposalById: event.proposalById)));
  }

  supplierProposalsMsgErr(SupplierProposalsMsgErr event, emit) async {
    emit(SupplierProposalsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SupplierProposalsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
