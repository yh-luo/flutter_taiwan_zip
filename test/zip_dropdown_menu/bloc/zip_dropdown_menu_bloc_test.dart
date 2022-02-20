// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_taiwan_zip/flutter_taiwan_zip.dart';
import 'package:taiwan_zip/taiwan_zip.dart';
import 'package:test/test.dart';

// Mock
class MockZipDropdownMenuBloc
    extends MockBloc<ZipDropdownMenuEvent, ZipDropdownMenuState>
    implements ZipDropdownMenuBloc {}

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

    blocTest<ZipDropdownMenuBloc, ZipDropdownMenuState>(
      'emits nothing when nothing happens',
      build: () => ZipDropdownMenuBloc(),
      expect: () => const <ZipDropdownMenuState>[],
    );

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
      final List<String> currentDistricts = TaiwanZip.getDistricts(city);

      blocTest<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        'changes district',
        build: () => ZipDropdownMenuBloc(),
        act: (bloc) => bloc.add(DistrictChanged(district)),
        expect: () => [
          isA<ZipDropdownMenuState>()
              .having((state) => state.city, 'city should not change', city)
              .having((state) => state.currentDistricts,
                  'current districts should not change', currentDistricts)
              .having((state) => state.district, 'district', district)
              .having((state) => state.zipCode, 'zip code', zipCode),
        ],
      );
    });

    group('whenListen to bloc', () {
      test('correct stream of states', () {
        final bloc = MockZipDropdownMenuBloc();
        final states = [
          ZipDropdownMenuState(),
          ZipDropdownMenuState(district: '大同區', zipCode: '103'),
        ];
        whenListen(bloc, Stream.fromIterable(states));
        expectLater(
          bloc.stream,
          emitsInOrder(states),
        );
      });
    });
  });

  group('ZipDropdownMenuState', () {
    group('copyWith', () {
      const String city = '基隆市';
      const String district = '仁愛區';
      const String zipCode = '201';
      final List<String> currentDistricts = TaiwanZip.getDistricts(city);
      final state = ZipDropdownMenuState();

      test('city', () {
        final actual = state.copyWith(city: city);
        expect(actual.city, city);
        expect(actual == state, false);
      });

      test('district', () {
        final actual = state.copyWith(district: district);
        expect(actual.district, district);
        expect(actual == state, false);
      });
      test('zipCode', () {
        final actual = state.copyWith(zipCode: zipCode);
        expect(actual.zipCode, zipCode);
        expect(actual == state, false);
      });

      test('currentDistricts', () {
        final actual = state.copyWith(currentDistricts: currentDistricts);
        expect(actual.currentDistricts, currentDistricts);
        expect(actual == state, false);
      });
    });
  });
}
