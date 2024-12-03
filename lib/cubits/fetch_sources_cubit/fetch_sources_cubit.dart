import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_v2/cubits/fetch_sources_cubit/fetch_sources_state.dart';
import 'package:news_app_v2/services/get_sources_service.dart';

class FetchSourcesCubit extends Cubit<FetchSourcesState> {
  FetchSourcesCubit() : super(FetchSourcesInitial());
  fetchSources(String category) async {
    emit(FetchSourcesLoading());
    var data = await GetSourcesService.getSources(category);
    data.fold(
      (failure) {
        emit(FetchSourcesFailure(errorMessage: failure.errorMessage));
      },
      (sourcesList) {
        emit(FetchSourcesSuccess(sources: sourcesList.sources ?? []));
      },
    );
  }
}
