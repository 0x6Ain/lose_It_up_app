// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HttpResponse _$$_HttpResponseFromJson(Map<String, dynamic> json) =>
    _$_HttpResponse(
      data: json['data'],
      totalCount: json['totalCount'] as int?,
      currentPage: json['currentPage'] as int?,
      pageSize: json['pageSize'] as int?,
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$$_HttpResponseToJson(_$_HttpResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
    };
