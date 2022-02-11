part of 'zip_dropdown_menu_bloc.dart';

@JsonSerializable()
class ZipDropdownMenuState extends Equatable {
  const ZipDropdownMenuState({
    this.city = '臺北市',
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
      '文山區',
    ],
  });

  final String city;
  final String district;
  final String zipCode;
  final List<String> currentDistricts;

  ZipDropdownMenuState copyWith({
    String? city,
    String? district,
    String? zipCode,
    List<String>? currentDistricts,
  }) {
    return ZipDropdownMenuState(
      city: city ?? this.city,
      district: district ?? this.district,
      zipCode: zipCode ?? this.zipCode,
      currentDistricts: currentDistricts ?? this.currentDistricts,
    );
  }

  @override
  List<Object> get props => [city, district, currentDistricts];
}
