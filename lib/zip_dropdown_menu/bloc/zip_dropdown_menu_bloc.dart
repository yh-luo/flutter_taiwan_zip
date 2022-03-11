import 'package:bloc/bloc.dart';
import 'package:taiwan_zip/taiwan_zip.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'zip_dropdown_menu_bloc.freezed.dart';
part 'zip_dropdown_menu_event.dart';
part 'zip_dropdown_menu_state.dart';

class ZipDropdownMenuBloc
    extends Bloc<ZipDropdownMenuEvent, ZipDropdownMenuState> {
  ZipDropdownMenuBloc() : super(const ZipDropdownMenuState()) {
    on<_CityChanged>(_onCityChanged);
    on<_DistrictChanged>(_onDistrictChanged);
  }

  List<String> get cities => TaiwanZip.cities;

  /// event handler when the user changes the city
  void _onCityChanged(_CityChanged event, Emitter<ZipDropdownMenuState> emit) {
    final currentDistricts = TaiwanZip.getDistricts(event.city);
    emit(state.copyWith(
        city: event.city,
        district: currentDistricts[0],
        zipCode: TaiwanZip.toZip(event.city + currentDistricts[0]),
        currentDistricts: currentDistricts));
  }

  /// event handler when the user changes the district
  void _onDistrictChanged(
      _DistrictChanged event, Emitter<ZipDropdownMenuState> emit) {
    emit(state.copyWith(
        district: event.district,
        zipCode: TaiwanZip.toZip(state.city + event.district)));
  }
}
