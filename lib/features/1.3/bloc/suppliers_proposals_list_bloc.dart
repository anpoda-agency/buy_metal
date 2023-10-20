import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'suppliers_proposals_list_event.dart';
part 'suppliers_proposals_list_state.dart';

class SuppliersProposalsListBloc extends Bloc<SuppliersProposalsListEvent, SuppliersProposalsListState> {
  final ApplicationRepository applicationRepository;
  final UserRepository userRepository;
  final String applicationId;
  SuppliersProposalsListBloc({
    required this.applicationRepository,
    required this.userRepository,
    required this.applicationId,
    required PageState pageState,
  }) : super(SuppliersProposalsListInitial(pageState)) {
    on<SuppliersProposalsListInit>(suppliersProposalsListInit);
    on<SuppliersProposalsListMsgErr>(suppliersProposalsListMsgErr);
    on<SupplierProposalsListChooseProposalEvent>(supplierProposalsListChooseProposal);
    add(SuppliersProposalsListInit());
  }

  suppliersProposalsListInit(SuppliersProposalsListInit event, emit) async {
    emit(SuppliersProposalsListUp(state.pageState.copyWith(onAwait: true)));

    var token = userRepository.user?.accessToken;
    var res =
        await applicationRepository.applicationGetResponsesByApplicationId(path: applicationId, accessToken: token);

    emit(SuppliersProposalsListUp(state.pageState.copyWith(response: res, onAwait: false)));
  }

  supplierProposalsListChooseProposal(SupplierProposalsListChooseProposalEvent event, emit) async {
    //var model = userRepository.user;
    //var model = state.pageState.copyWith(proposalById: event.proposalById);

    emit(SupplierProposalsListChooseProposalState(state.pageState.copyWith(proposalById: event.proposalById)));
  }

  suppliersProposalsListMsgErr(SuppliersProposalsListMsgErr event, emit) async {
    emit(SuppliersProposalsListError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SuppliersProposalsListMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
