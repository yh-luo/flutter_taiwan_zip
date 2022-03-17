// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_taiwan_zip/flutter_taiwan_zip.dart';
import 'package:mocktail/mocktail.dart';

class MockZipDropdownMenuBloc
    extends MockBloc<ZipDropdownMenuEvent, ZipDropdownMenuState>
    implements ZipDropdownMenuBloc {}

const _cityKey = Key('ZipDropdownMenuView_city');
const _districtKey = Key('ZipDropdownMenuView_district');

void main() {
  late ZipDropdownMenuBloc zipDropdownMenuBloc;

  setUp(() {
    zipDropdownMenuBloc = MockZipDropdownMenuBloc();
  });

  group('ZipDropdownMenu', () {
    testWidgets('renders ZipDropdownMenuView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ZipDropdownMenu(),
          ),
        ),
      );

      expect(find.byType(ZipDropdownMenuView), findsOneWidget);
    });
  });

  group('ZipDropdownMenuView', () {
    final state = ZipDropdownMenuState();
    const List<String> cities = ['臺北市', '新北市'];

    setUp(() {
      when(() => zipDropdownMenuBloc.cities).thenReturn(cities);
      when(() => zipDropdownMenuBloc.state).thenReturn(state);
    });

    testWidgets('renders ZipDropdownMenuBloc state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: zipDropdownMenuBloc,
              child: ZipDropdownMenuView(),
            ),
          ),
        ),
      );

      // cities are rendered
      expect(find.text(cities[0]), findsOneWidget);
      expect(find.text(cities[1]), findsOneWidget);
      // current districts are rendered
      expect(find.text(state.currentDistricts[0]), findsOneWidget);
      // district is rendered
      expect(find.text(state.district), findsOneWidget);
      // zipCode is rendered
      expect(find.text(state.zipCode), findsOneWidget);
    });

    group('CityDropdownButton', () {
      const String city = '新北市';

      testWidgets('tapping a city item invokes CityChanged', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                  value: zipDropdownMenuBloc, child: ZipDropdownMenuView()),
            ),
          ),
        );

        final dropdown = find.byKey(_cityKey);
        await tester.tap(dropdown);
        await tester.pumpAndSettle();

        final cityItem = find.text(city).last;
        await tester.tap(cityItem);
        await tester.pumpAndSettle();

        verify(() =>
                zipDropdownMenuBloc.add(ZipDropdownMenuEvent.cityChanged(city)))
            .called(1);
      });

      testWidgets('calls onCityChanged', (tester) async {
        var called = false;
        onCityChanged(String city) {
          called = true;
        }

        whenListen(
          zipDropdownMenuBloc,
          Stream<ZipDropdownMenuState>.fromIterable([
            ZipDropdownMenuState(city: city),
          ]),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: zipDropdownMenuBloc,
                child: ZipDropdownMenuView(
                  onCityChanged: onCityChanged,
                ),
              ),
            ),
          ),
        );

        expect(called, true);
      });
    });

    group('DistrictDropdownButton', () {
      const String district = '士林區';

      testWidgets('tapping a district item invokes DistrictChanged',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: zipDropdownMenuBloc,
                child: ZipDropdownMenuView(),
              ),
            ),
          ),
        );

        final dropdown = find.byKey(_districtKey);
        await tester.tap(dropdown);
        await tester.pumpAndSettle();

        final districtItem = find.text(district).last;
        await tester.tap(districtItem);
        await tester.pumpAndSettle();

        verify(() => zipDropdownMenuBloc
            .add(ZipDropdownMenuEvent.districtChanged(district))).called(1);
      });

      testWidgets('calls onDistrictChanged', (tester) async {
        var called = false;
        onDistrictChanged(String district) {
          called = true;
        }

        whenListen(
          zipDropdownMenuBloc,
          Stream<ZipDropdownMenuState>.fromIterable([
            ZipDropdownMenuState(district: district),
          ]),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: zipDropdownMenuBloc,
                child: ZipDropdownMenuView(
                  onDistrictChanged: onDistrictChanged,
                ),
              ),
            ),
          ),
        );

        expect(called, true);
      });
    });

    group('ZipField', () {
      const String district = '士林區';
      const String zipCode = '111';

      testWidgets('renders the correct zip code when district changes',
          (tester) async {
        whenListen(
          zipDropdownMenuBloc,
          Stream<ZipDropdownMenuState>.fromIterable([
            ZipDropdownMenuState(district: district, zipCode: zipCode),
          ]),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                  value: zipDropdownMenuBloc, child: ZipDropdownMenuView()),
            ),
          ),
        );

        final dropdown = find.byKey(_districtKey);
        await tester.tap(dropdown);
        await tester.pumpAndSettle();

        final districtItem = find.text(district).last;
        await tester.tap(districtItem);
        await tester.pumpAndSettle();

        expect(find.text(state.zipCode), findsNothing); // the default zip code
        expect(find.text(zipCode), findsOneWidget);
      });

      testWidgets('calls onZipCodeChanged', (tester) async {
        var called = false;
        onZipCodeChanged(String zipCode) {
          called = true;
        }

        whenListen(
            zipDropdownMenuBloc,
            Stream<ZipDropdownMenuState>.fromIterable([
              ZipDropdownMenuState(district: district, zipCode: zipCode),
            ]));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                  value: zipDropdownMenuBloc,
                  child: ZipDropdownMenuView(
                    onZipCodeChanged: onZipCodeChanged,
                  )),
            ),
          ),
        );

        final dropdown = find.byKey(_districtKey);
        await tester.tap(dropdown);
        await tester.pumpAndSettle();

        final districtItem = find.text(district).last;
        await tester.tap(districtItem);
        await tester.pumpAndSettle();

        expect(called, true);
      });
    });
  });
}
