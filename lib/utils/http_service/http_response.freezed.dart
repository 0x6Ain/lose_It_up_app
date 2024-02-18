// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HttpResponse _$HttpResponseFromJson(Map<String, dynamic> json) {
  return _HttpResponse.fromJson(json);
}

/// @nodoc
mixin _$HttpResponse {
  dynamic get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HttpResponseCopyWith<HttpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResponseCopyWith<$Res> {
  factory $HttpResponseCopyWith(
          HttpResponse value, $Res Function(HttpResponse) then) =
      _$HttpResponseCopyWithImpl<$Res, HttpResponse>;
  @useResult
  $Res call(
      {dynamic data,
      int? totalCount,
      int? currentPage,
      int? pageSize,
      int? totalPages});
}

/// @nodoc
class _$HttpResponseCopyWithImpl<$Res, $Val extends HttpResponse>
    implements $HttpResponseCopyWith<$Res> {
  _$HttpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? pageSize = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HttpResponseCopyWith<$Res>
    implements $HttpResponseCopyWith<$Res> {
  factory _$$_HttpResponseCopyWith(
          _$_HttpResponse value, $Res Function(_$_HttpResponse) then) =
      __$$_HttpResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic data,
      int? totalCount,
      int? currentPage,
      int? pageSize,
      int? totalPages});
}

/// @nodoc
class __$$_HttpResponseCopyWithImpl<$Res>
    extends _$HttpResponseCopyWithImpl<$Res, _$_HttpResponse>
    implements _$$_HttpResponseCopyWith<$Res> {
  __$$_HttpResponseCopyWithImpl(
      _$_HttpResponse _value, $Res Function(_$_HttpResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? pageSize = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(_$_HttpResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HttpResponse implements _HttpResponse {
  _$_HttpResponse(
      {this.data,
      this.totalCount,
      this.currentPage,
      this.pageSize,
      this.totalPages});

  factory _$_HttpResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HttpResponseFromJson(json);

  @override
  final dynamic data;
  @override
  final int? totalCount;
  @override
  final int? currentPage;
  @override
  final int? pageSize;
  @override
  final int? totalPages;

  @override
  String toString() {
    return 'HttpResponse(data: $data, totalCount: $totalCount, currentPage: $currentPage, pageSize: $pageSize, totalPages: $totalPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpResponse &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      totalCount,
      currentPage,
      pageSize,
      totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HttpResponseCopyWith<_$_HttpResponse> get copyWith =>
      __$$_HttpResponseCopyWithImpl<_$_HttpResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HttpResponseToJson(
      this,
    );
  }
}

abstract class _HttpResponse implements HttpResponse {
  factory _HttpResponse(
      {final dynamic data,
      final int? totalCount,
      final int? currentPage,
      final int? pageSize,
      final int? totalPages}) = _$_HttpResponse;

  factory _HttpResponse.fromJson(Map<String, dynamic> json) =
      _$_HttpResponse.fromJson;

  @override
  dynamic get data;
  @override
  int? get totalCount;
  @override
  int? get currentPage;
  @override
  int? get pageSize;
  @override
  int? get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$_HttpResponseCopyWith<_$_HttpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
