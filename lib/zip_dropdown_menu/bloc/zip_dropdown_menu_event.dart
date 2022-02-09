part of 'zip_dropdown_menu_bloc.dart';

abstract class ZipDropdownMenuEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CityChanged extends ZipDropdownMenuEvent {
  CityChanged(this.city);
  final String city;
  @override
  List<Object> get props => [city];
}

class DistrictChanged extends ZipDropdownMenuEvent {
  DistrictChanged(this.district);
  final String district;
  @override
  List<Object> get props => [district];
}
