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
    const List<String> cities = ['臺北市', '新北市'];

    testWidgets('renders the current ZipDropdownMenuBloc state',
        (tester) async {
      final state = ZipDropdownMenuState();
      when(() => zipDropdownMenuBloc.cities).thenReturn(cities);
      when(() => zipDropdownMenuBloc.state).thenReturn(state);
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

    testWidgets('tapping a city item invokes CityChanged', (tester) async {
      final state = ZipDropdownMenuState();
      var city = '新北市';
      when(() => zipDropdownMenuBloc.cities).thenReturn(cities);
      when(() => zipDropdownMenuBloc.state).thenReturn(state);
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

    testWidgets('tapping a district item invokes DistrictChanged',
        (tester) async {
      final state = ZipDropdownMenuState();
      var district = '士林區';
      when(() => zipDropdownMenuBloc.cities).thenReturn(cities);
      when(() => zipDropdownMenuBloc.state).thenReturn(state);
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

      verify(() => zipDropdownMenuBloc
          .add(ZipDropdownMenuEvent.districtChanged(district))).called(1);
    });
  });
}
