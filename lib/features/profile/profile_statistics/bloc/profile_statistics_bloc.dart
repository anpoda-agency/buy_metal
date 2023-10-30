import 'package:buy_metal_app/data/models/statistics_models/statistics_get_statistics_response.dart';
import 'package:buy_metal_app/domain/repository/statistics_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_statistics_event.dart';
part 'profile_statistics_state.dart';

class ProfileStatisticsBloc extends Bloc<ProfileStatisticsEvent, ProfileStatisticsState> {
  final UserRepository userRepository;
  final StatisticsRepository statisticsRepository;

  ProfileStatisticsBloc({
    required this.userRepository,
    required this.statisticsRepository,
    required PageState pageState,
  }) : super(ProfileStatisticsInitial(pageState)) {
    on<ProfileStatisticsInit>(profileStatisticsInit);
    on<ProfileStatisticsMsgErr>(profileStatisticsMsgErr);
    add(ProfileStatisticsInit());
  }

  profileStatisticsInit(ProfileStatisticsInit event, emit) async {
    var accessToken = userRepository.user?.accessToken;

    Map<String, dynamic> queryParams = {
      "duration": 1,
      "month": 10,
      "year": 2023,
    };

    var res = await statisticsRepository.statisticsGetStatistics(queryParams: queryParams, accessToken: accessToken);

    emit(ProfileStatisticsUp(state.pageState.copyWith(response: res)));
  }

  profileStatisticsMsgErr(ProfileStatisticsMsgErr event, emit) async {
    emit(ProfileStatisticsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileStatisticsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
