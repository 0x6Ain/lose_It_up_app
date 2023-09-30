import 'package:freezed_annotation/freezed_annotation.dart';
part 'http_response.freezed.dart';
part 'http_response.g.dart';

@freezed
class HttpResponse with _$HttpResponse {
  factory HttpResponse({
    dynamic data,
    int? totalCount,
    int? currentPage,
    int? pageSize,
    int? totalPages,
  }) = _HttpResponse;

  factory HttpResponse.fromJson(Map<String, dynamic> json) => _$HttpResponseFromJson(json);
}
