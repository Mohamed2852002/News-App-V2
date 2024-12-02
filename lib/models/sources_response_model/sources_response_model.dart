import 'source.dart';

class SourcesResponseModel {
  String? status;
  List<Source>? sources;
  String? errorMessage;

  SourcesResponseModel({this.status, this.sources, this.errorMessage});

  factory SourcesResponseModel.fromJson(Map<String, dynamic> json) {
    return SourcesResponseModel(
      errorMessage: json['error'],
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': errorMessage,
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };
}
