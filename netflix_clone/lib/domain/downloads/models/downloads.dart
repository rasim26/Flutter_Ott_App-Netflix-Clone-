// we need to create a json format as we need to convert to json
import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads.freezed.dart';
part 'downloads.g.dart';

// both ptf and pts needed for clearning errors of build_runner
@freezed
class Downloads with _$Downloads {
  const factory Downloads({
    @JsonKey(name: 'poster_path') required String? backdropPath,
  }) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
//implement bloc for api call.