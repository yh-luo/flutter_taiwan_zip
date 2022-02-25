part of 'zip_dropdown_menu_bloc.dart';

@freezed
class ZipDropdownMenuEvent {
  const factory ZipDropdownMenuEvent.cityChanged(String city) =
      ZipDropdownMenuCityChanged;
  const factory ZipDropdownMenuEvent.districtChanged(String district) =
      ZipDropdownMenuDistrictChanged;
}
