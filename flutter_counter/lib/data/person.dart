import 'package:freezed_annotation/freezed_annotation.dart';
part 'person.freezed.dart';

//creating a mixin
// _$ is used for freeze
@freezed
class Person with _$Person {
  const factory Person({
    required String name,
    required int age,
  }) = _Person;
}
