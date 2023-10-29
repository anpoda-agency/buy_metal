import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_statistics_event.dart';
part 'profile_statistics_state.dart';

class ProfileStatisticsBloc extends Bloc<ProfileStatisticsEvent, ProfileStatisticsState> {
  ProfileStatisticsBloc({
    required PageState pageState,
  }) : super(ProfileStatisticsInitial(pageState)) {
    on<ProfileStatisticsInit>(profileStatisticsInit);
    on<ProfileStatisticsMsgErr>(profileStatisticsMsgErr);
    add(ProfileStatisticsInit());
  }

  profileStatisticsInit(ProfileStatisticsInit event, emit) async {
    emit(ProfileStatisticsUp(state.pageState));
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
