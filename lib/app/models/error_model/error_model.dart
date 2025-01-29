import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    required String? code,
    required String? message,
    @Default(false) bool isUrgentError,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, Object?> json) => _$ErrorModelFromJson(json);
}
