// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_auth_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailAuthRequestModel _$EmailAuthRequestModelFromJson(
    Map<String, dynamic> json) {
  return _EmailAuthRequestModel.fromJson(json);
}

/// @nodoc
mixin _$EmailAuthRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this EmailAuthRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailAuthRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailAuthRequestModelCopyWith<EmailAuthRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailAuthRequestModelCopyWith<$Res> {
  factory $EmailAuthRequestModelCopyWith(EmailAuthRequestModel value,
          $Res Function(EmailAuthRequestModel) then) =
      _$EmailAuthRequestModelCopyWithImpl<$Res, EmailAuthRequestModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$EmailAuthRequestModelCopyWithImpl<$Res,
        $Val extends EmailAuthRequestModel>
    implements $EmailAuthRequestModelCopyWith<$Res> {
  _$EmailAuthRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailAuthRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailAuthRequestModelImplCopyWith<$Res>
    implements $EmailAuthRequestModelCopyWith<$Res> {
  factory _$$EmailAuthRequestModelImplCopyWith(
          _$EmailAuthRequestModelImpl value,
          $Res Function(_$EmailAuthRequestModelImpl) then) =
      __$$EmailAuthRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$EmailAuthRequestModelImplCopyWithImpl<$Res>
    extends _$EmailAuthRequestModelCopyWithImpl<$Res,
        _$EmailAuthRequestModelImpl>
    implements _$$EmailAuthRequestModelImplCopyWith<$Res> {
  __$$EmailAuthRequestModelImplCopyWithImpl(_$EmailAuthRequestModelImpl _value,
      $Res Function(_$EmailAuthRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailAuthRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$EmailAuthRequestModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailAuthRequestModelImpl implements _EmailAuthRequestModel {
  const _$EmailAuthRequestModelImpl(
      {required this.email, required this.password});

  factory _$EmailAuthRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailAuthRequestModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'EmailAuthRequestModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAuthRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of EmailAuthRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAuthRequestModelImplCopyWith<_$EmailAuthRequestModelImpl>
      get copyWith => __$$EmailAuthRequestModelImplCopyWithImpl<
          _$EmailAuthRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailAuthRequestModelImplToJson(
      this,
    );
  }
}

abstract class _EmailAuthRequestModel implements EmailAuthRequestModel {
  const factory _EmailAuthRequestModel(
      {required final String email,
      required final String password}) = _$EmailAuthRequestModelImpl;

  factory _EmailAuthRequestModel.fromJson(Map<String, dynamic> json) =
      _$EmailAuthRequestModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of EmailAuthRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailAuthRequestModelImplCopyWith<_$EmailAuthRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
