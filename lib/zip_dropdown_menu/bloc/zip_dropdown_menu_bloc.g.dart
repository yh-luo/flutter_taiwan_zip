// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zip_dropdown_menu_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZipDropdownMenuState _$ZipDropdownMenuStateFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ZipDropdownMenuState',
      json,
      ($checkedConvert) {
        final val = ZipDropdownMenuState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$ZipDropdownMenuStatusEnumMap, v) ??
                  ZipDropdownMenuStatus.initial),
          city: $checkedConvert('city', (v) => v as String? ?? '臺北市'),
          district: $checkedConvert('district', (v) => v as String? ?? '中正區'),
          zipCode: $checkedConvert('zip_code', (v) => v as String? ?? '100'),
          currentDistricts: $checkedConvert(
              'current_districts',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const <String>[
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
                  ]),
        );
        return val;
      },
      fieldKeyMap: const {
        'zipCode': 'zip_code',
        'currentDistricts': 'current_districts'
      },
    );

Map<String, dynamic> _$ZipDropdownMenuStateToJson(
        ZipDropdownMenuState instance) =>
    <String, dynamic>{
      'status': _$ZipDropdownMenuStatusEnumMap[instance.status],
      'city': instance.city,
      'district': instance.district,
      'zip_code': instance.zipCode,
      'current_districts': instance.currentDistricts,
    };

const _$ZipDropdownMenuStatusEnumMap = {
  ZipDropdownMenuStatus.initial: 'initial',
  ZipDropdownMenuStatus.success: 'success',
  ZipDropdownMenuStatus.failure: 'failure',
};
