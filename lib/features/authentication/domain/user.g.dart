// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      introduction: json['introduction'] as String?,
      posts: json['posts'] as int? ?? 0,
      follower: json['follower'] as int? ?? 0,
      following: json['following'] as int? ?? 0,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
      'introduction': instance.introduction,
      'posts': instance.posts,
      'follower': instance.follower,
      'following': instance.following,
    };
