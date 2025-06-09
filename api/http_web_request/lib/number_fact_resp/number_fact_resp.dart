import 'package:json_annotation/json_annotation.dart';

part 'number_fact_resp.g.dart';

@JsonSerializable()
class NumberFactResp {
  @JsonKey(name: 'text')
  String? text;

  @JsonKey(name: 'number')
  int? number;

  @JsonKey(name: 'found')
  bool? found;

  @JsonKey(name: 'type')
  String? type;

  NumberFactResp({
    this.text,
    this.number,
    this.found,
    this.type,
  });

  factory NumberFactResp.fromJson(Map<String, dynamic> json) {
    return _$NumberFactRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NumberFactRespToJson(this);
}
