import 'package:freezed_annotation/freezed_annotation.dart' show freezed, useResult;
import 'package:json_annotation/json_annotation.dart';
//сгенерированные файлы
part 'user.freezed.dart'; 
part 'user.g.dart'; 

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
