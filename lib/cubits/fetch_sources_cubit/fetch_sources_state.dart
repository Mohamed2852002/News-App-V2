import 'package:news_app_v2/models/sources_response_model/source.dart';

class FetchSourcesState {}

final class FetchSourcesInitial extends FetchSourcesState {}

final class FetchSourcesLoading extends FetchSourcesState {}

final class FetchSourcesSuccess extends FetchSourcesState {
  final List<Source> sources;

  FetchSourcesSuccess({required this.sources});
}

final class FetchSourcesFailure extends FetchSourcesState {
  final String errorMessage;

  FetchSourcesFailure({required this.errorMessage});
}
