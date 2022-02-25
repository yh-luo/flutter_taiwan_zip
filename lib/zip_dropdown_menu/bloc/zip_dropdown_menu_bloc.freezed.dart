// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'zip_dropdown_menu_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ZipDropdownMenuStateTearOff {
  const _$ZipDropdownMenuStateTearOff();

  _ZipDropdownMenuState call(
      {String city = '臺北市',
      String district = '中正區',
      String zipCode = '100',
      List<String> currentDistricts = const <String>[
        '中正區',
        '大同區',
        '中山區',
        '松山區',
        '大安區',
        '萬華區',
        '信義區',
        '士林區',
        '北投區',
        '內湖區',
        '南港區',
        '文山區'
      ]}) {
    return _ZipDropdownMenuState(
      city: city,
      district: district,
      zipCode: zipCode,
      currentDistricts: currentDistricts,
    );
  }
}

/// @nodoc
const $ZipDropdownMenuState = _$ZipDropdownMenuStateTearOff();

/// @nodoc
mixin _$ZipDropdownMenuState {
  String get city => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  List<String> get currentDistricts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ZipDropdownMenuStateCopyWith<ZipDropdownMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZipDropdownMenuStateCopyWith<$Res> {
  factory $ZipDropdownMenuStateCopyWith(ZipDropdownMenuState value,
          $Res Function(ZipDropdownMenuState) then) =
      _$ZipDropdownMenuStateCopyWithImpl<$Res>;
  $Res call(
      {String city,
      String district,
      String zipCode,
      List<String> currentDistricts});
}

/// @nodoc
class _$ZipDropdownMenuStateCopyWithImpl<$Res>
    implements $ZipDropdownMenuStateCopyWith<$Res> {
  _$ZipDropdownMenuStateCopyWithImpl(this._value, this._then);

  final ZipDropdownMenuState _value;
  // ignore: unused_field
  final $Res Function(ZipDropdownMenuState) _then;

  @override
  $Res call({
    Object? city = freezed,
    Object? district = freezed,
    Object? zipCode = freezed,
    Object? currentDistricts = freezed,
  }) {
    return _then(_value.copyWith(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: zipCode == freezed
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentDistricts: currentDistricts == freezed
          ? _value.currentDistricts
          : currentDistricts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ZipDropdownMenuStateCopyWith<$Res>
    implements $ZipDropdownMenuStateCopyWith<$Res> {
  factory _$ZipDropdownMenuStateCopyWith(_ZipDropdownMenuState value,
          $Res Function(_ZipDropdownMenuState) then) =
      __$ZipDropdownMenuStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String city,
      String district,
      String zipCode,
      List<String> currentDistricts});
}

/// @nodoc
class __$ZipDropdownMenuStateCopyWithImpl<$Res>
    extends _$ZipDropdownMenuStateCopyWithImpl<$Res>
    implements _$ZipDropdownMenuStateCopyWith<$Res> {
  __$ZipDropdownMenuStateCopyWithImpl(
      _ZipDropdownMenuState _value, $Res Function(_ZipDropdownMenuState) _then)
      : super(_value, (v) => _then(v as _ZipDropdownMenuState));

  @override
  _ZipDropdownMenuState get _value => super._value as _ZipDropdownMenuState;

  @override
  $Res call({
    Object? city = freezed,
    Object? district = freezed,
    Object? zipCode = freezed,
    Object? currentDistricts = freezed,
  }) {
    return _then(_ZipDropdownMenuState(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: zipCode == freezed
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentDistricts: currentDistricts == freezed
          ? _value.currentDistricts
          : currentDistricts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ZipDropdownMenuState implements _ZipDropdownMenuState {
  const _$_ZipDropdownMenuState(
      {this.city = '臺北市',
      this.district = '中正區',
      this.zipCode = '100',
      this.currentDistricts = const <String>[
        '中正區',
        '大同區',
        '中山區',
        '松山區',
        '大安區',
        '萬華區',
        '信義區',
        '士林區',
        '北投區',
        '內湖區',
        '南港區',
        '文山區'
      ]});

  @JsonKey()
  @override
  final String city;
  @JsonKey()
  @override
  final String district;
  @JsonKey()
  @override
  final String zipCode;
  @JsonKey()
  @override
  final List<String> currentDistricts;

  @override
  String toString() {
    return 'ZipDropdownMenuState(city: $city, district: $district, zipCode: $zipCode, currentDistricts: $currentDistricts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZipDropdownMenuState &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.district, district) &&
            const DeepCollectionEquality().equals(other.zipCode, zipCode) &&
            const DeepCollectionEquality()
                .equals(other.currentDistricts, currentDistricts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(district),
      const DeepCollectionEquality().hash(zipCode),
      const DeepCollectionEquality().hash(currentDistricts));

  @JsonKey(ignore: true)
  @override
  _$ZipDropdownMenuStateCopyWith<_ZipDropdownMenuState> get copyWith =>
      __$ZipDropdownMenuStateCopyWithImpl<_ZipDropdownMenuState>(
          this, _$identity);
}

abstract class _ZipDropdownMenuState implements ZipDropdownMenuState {
  const factory _ZipDropdownMenuState(
      {String city,
      String district,
      String zipCode,
      List<String> currentDistricts}) = _$_ZipDropdownMenuState;

  @override
  String get city;
  @override
  String get district;
  @override
  String get zipCode;
  @override
  List<String> get currentDistricts;
  @override
  @JsonKey(ignore: true)
  _$ZipDropdownMenuStateCopyWith<_ZipDropdownMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}
