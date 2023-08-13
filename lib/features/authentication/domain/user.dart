import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Simple class representing the user UID and email.
@freezed
class User with _$User {
  factory User({
    required String uid,
    required String email,
    String? name,
    String? image,
    String? introduction,
    @Default(0) int? posts,
    @Default(0) int? follower,
    @Default(0) int? following,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
