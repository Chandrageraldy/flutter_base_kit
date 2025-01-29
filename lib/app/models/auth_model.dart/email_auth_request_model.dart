import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_auth_request_model.freezed.dart';
part 'email_auth_request_model.g.dart';

@freezed
class EmailAuthRequestModel with _$EmailAuthRequestModel {
  const factory EmailAuthRequestModel({
    required String email,
    required String password,
  }) = _EmailAuthRequestModel;

  factory EmailAuthRequestModel.fromJson(Map<String, Object?> json) => _$EmailAuthRequestModelFromJson(json);
}
