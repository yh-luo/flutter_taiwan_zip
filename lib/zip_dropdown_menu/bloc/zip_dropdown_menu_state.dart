part of 'zip_dropdown_menu_bloc.dart';

enum ZipDropdownMenuStatus { initial, success, failure }

extension ZipDropdownMenuStatusX on ZipDropdownMenuStatus {
  bool get isInitial => this == ZipDropdownMenuStatus.initial;
  bool get isSuccess => this == ZipDropdownMenuStatus.success;
  bool get isFailure => this == ZipDropdownMenuStatus.failure;
}

@JsonSerializable()
class ZipDropdownMenuState extends Equatable {
  const ZipDropdownMenuState({
    this.status = ZipDropdownMenuStatus.initial,
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

  final ZipDropdownMenuStatus status;
  final String city;
  final String district;
  final String zipCode;
  final List<String> currentDistricts;

  ZipDropdownMenuState copyWith({
    ZipDropdownMenuStatus? status,
    String? city,
    String? district,
    String? zipCode,
    List<String>? currentDistricts,
  }) {
    return ZipDropdownMenuState(
      status: status ?? this.status,
      city: city ?? this.city,
      district: district ?? this.district,
      zipCode: zipCode ?? this.zipCode,
      currentDistricts: currentDistricts ?? this.currentDistricts,
    );
  }

  factory ZipDropdownMenuState.fromJson(Map<String, dynamic> json) =>
      _$ZipDropdownMenuStateFromJson(json);
  Map<String, dynamic> toJson() => _$ZipDropdownMenuStateToJson(this);

  @override
  List<Object> get props => [status, city, district, currentDistricts];
}
