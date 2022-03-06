part of 'zip_dropdown_menu_bloc.dart';

/// `city` is the current selected city and `district` is the current selected
/// district. `zipCode` changes automatically according to the
/// current district.
/// `currentDistricts` is a list of districts in the selected city. It is
/// used to provide dropdown items for user interaction.
@freezed
class ZipDropdownMenuState with _$ZipDropdownMenuState {
  const factory ZipDropdownMenuState({
    @Default('臺北市')
        String city,
    @Default('中正區')
        String district,
    @Default('100')
        String zipCode,
    @Default(<String>[
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
    ])
        List<String> currentDistricts,
  }) = _ZipDropdownMenuState;
}
