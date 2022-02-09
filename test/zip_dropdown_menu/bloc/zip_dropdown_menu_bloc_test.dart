// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_taiwan_zip/flutter_taiwan_zip.dart';
import 'package:test/test.dart';

void main() {
  group('ZipDropdownMenuBloc', () {
    test('initial state is correct', () {
      final zipDropdownMenuBloc = ZipDropdownMenuBloc();
      expect(zipDropdownMenuBloc.state, ZipDropdownMenuState());
    });

    test('getter cities', () {
      final zipDropdownMenuBloc = ZipDropdownMenuBloc();
      expect(zipDropdownMenuBloc.cities, isNotEmpty);
    });

    group('_onCityChanged', () {
      const String city = '嘉義市';
      const String district = '東區';
      const List<String> currentDistricts = <String>['東區', '西區'];
      const String zipCode = '600E';
      blocTest<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        'changes city',
        build: () => ZipDropdownMenuBloc(),
        act: (bloc) => bloc.add(CityChanged(city)),
        expect: () => [
          isA<ZipDropdownMenuState>()
              .having((state) => state.city, 'city', city),
        ],
      );

      blocTest<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        'changes districts when city changes',
        build: () => ZipDropdownMenuBloc(),
        seed: () => ZipDropdownMenuState(),
        act: (bloc) => bloc.add(CityChanged(city)),
        expect: () => [
          isA<ZipDropdownMenuState>()
              .having((state) => state.district, 'default district', district)
              .having(
                  (state) => state.zipCode, 'default zip code changes', zipCode)
              .having((state) => state.currentDistricts,
                  'changes possible districts', currentDistricts),
        ],
      );
    });

    group('_onDistrictChanged', () {
      const String city = '臺北市';
      const String district = '士林區';
      const String zipCode = '111';

      blocTest<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        'changes district',
        build: () => ZipDropdownMenuBloc(),
        act: (bloc) => bloc.add(DistrictChanged(district)),
        expect: () => [
          isA<ZipDropdownMenuState>()
              .having((state) => state.city, 'city should not change', city)
              .having((state) => state.district, 'district', district)
              .having((state) => state.zipCode, 'zip code', zipCode),
        ],
      );
    });
  });
}
