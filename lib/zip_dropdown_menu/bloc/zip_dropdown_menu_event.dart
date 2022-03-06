part of 'zip_dropdown_menu_bloc.dart';

@freezed
class ZipDropdownMenuEvent {
  /// Event that the user changes the city
  const factory ZipDropdownMenuEvent.cityChanged(String city) = _CityChanged;

  /// Event that the user changes the district
  const factory ZipDropdownMenuEvent.districtChanged(String district) =
      _DistrictChanged;
}
