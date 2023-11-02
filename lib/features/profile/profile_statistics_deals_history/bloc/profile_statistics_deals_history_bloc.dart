import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_statistics_deals_history_event.dart';
part 'profile_statistics_deals_history_state.dart';

class ProfileStatisticsDealsHistoryBloc
    extends Bloc<ProfileStatisticsDealsHistoryEvent, ProfileStatisticsDealsHistoryState> {
  final UserRepository userRepository;
  final DealRepository dealRepository;
  ProfileStatisticsDealsHistoryBloc({
    required this.userRepository,
    required this.dealRepository,
    required PageState pageState,
  }) : super(ProfileStatisticsDealsHistoryInitial(pageState)) {
    on<ProfileStatisticsDealsHistoryInit>(profileStatisticsDealsHistoryInit);
    on<ProfileStatisticsDealsHistoryMsgErr>(profileStatisticsDealsHistoryMsgErr);
    add(ProfileStatisticsDealsHistoryInit());
  }

  profileStatisticsDealsHistoryInit(ProfileStatisticsDealsHistoryInit event, emit) async {
    var buyerId = userRepository.user?.user.id;
    var userAccessToken = userRepository.user?.accessToken;

    //var model = state.pageState.request.copyWith(customerId: buyerId, limit: 15, offset: 0, statuses: ["OPEN"]);
    var model = state.pageState.request.copyWith(supplierId: buyerId, limit: 15, offset: 0, statuses: ["COMPLETED"]);

    var res = await dealRepository.dealUploadSearch(request: model, accessToken: userAccessToken);

    emit(ProfileStatisticsDealsHistoryUp(state.pageState.copyWith(response: res)));
  }

  profileStatisticsDealsHistoryMsgErr(ProfileStatisticsDealsHistoryMsgErr event, emit) async {
    emit(ProfileStatisticsDealsHistoryError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileStatisticsDealsHistoryMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
