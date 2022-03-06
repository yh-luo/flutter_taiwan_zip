part of 'zip_dropdown_menu_bloc.dart';

@freezed
class ZipDropdownMenuEvent {
  const factory ZipDropdownMenuEvent.cityChanged(String city) = _CityChanged;
  const factory ZipDropdownMenuEvent.districtChanged(String district) =
      _DistrictChanged;
}
