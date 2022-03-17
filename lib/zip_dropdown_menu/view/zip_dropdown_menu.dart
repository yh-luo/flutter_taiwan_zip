import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../zip_dropdown_menu.dart';

const EdgeInsets padding = EdgeInsets.all(5.0);

/// A dropdown menu for finding zip code based on user interactions
///
/// The widget returns the corresponding zip code after the user selects a
/// district.
/// `onZipCodeChanged` is called when the zip code changes. `zipWidget`,
/// `cityWidget` and `districtWidget` provide more control over the widgets.
/// For example, `TextButton` can be used for user interactions. When they are
/// not specified, the default dropdown menu composes of `ZipField`,
/// `CityDropdownButton` and `DistrictDropdownButton` is used.
class ZipDropdownMenu extends StatelessWidget {
  const ZipDropdownMenu(
      {this.zipWidget,
      this.cityWidget,
      this.districtWidget,
      this.onZipCodeChanged,
      this.onCityChanged,
      this.onDistrictChanged,
      Key? key})
      : super(key: key);

  final Widget? zipWidget;
  final Widget? cityWidget;
  final Widget? districtWidget;
  final void Function(String zipCode)? onZipCodeChanged;
  final void Function(String city)? onCityChanged;
  final void Function(String district)? onDistrictChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ZipDropdownMenuBloc(),
      child: ZipDropdownMenuView(
        zipWidget: zipWidget,
        cityWidget: cityWidget,
        districtWidget: districtWidget,
        onZipCodeChanged: onZipCodeChanged,
        onCityChanged: onCityChanged,
        onDistrictChanged: onDistrictChanged,
      ),
    );
  }
}

class ZipDropdownMenuView extends StatelessWidget {
  const ZipDropdownMenuView(
      {this.zipWidget,
      this.cityWidget,
      this.districtWidget,
      this.onZipCodeChanged,
      this.onCityChanged,
      this.onDistrictChanged,
      Key? key})
      : super(key: key);

  final Widget? zipWidget;
  final Widget? cityWidget;
  final Widget? districtWidget;
  final void Function(String zipCode)? onZipCodeChanged;
  final void Function(String city)? onCityChanged;
  final void Function(String district)? onDistrictChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
        zipWidget ?? ZipField(onZipCodeChanged: onZipCodeChanged),
        cityWidget ?? CityDropdownButton(onCityChanged: onCityChanged),
        districtWidget ??
            DistrictDropdownButton(onDistrictChanged: onDistrictChanged),
      ],
    );
  }
}

class ZipField extends StatelessWidget {
  const ZipField({this.onZipCodeChanged, Key? key}) : super(key: key);

  final void Function(String zipCode)? onZipCodeChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.zipCode != current.zipCode,
        builder: (context, state) {
          if (onZipCodeChanged != null) {
            onZipCodeChanged!(state.zipCode);
          }
          return Text(
            state.zipCode,
            style: const TextStyle(
              fontSize: 16,
            ),
          );
        },
      ),
    );
  }
}

class CityDropdownButton extends StatelessWidget {
  const CityDropdownButton({this.onCityChanged, Key? key}) : super(key: key);

  final void Function(String city)? onCityChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.city != current.city,
        builder: (context, state) {
          if (onCityChanged != null) {
            onCityChanged!(state.zipCode);
          }
          return DropdownButton<String>(
            value: state.city,
            key: const Key('ZipDropdownMenuView_city'),
            elevation: 12,
            onChanged: (String? value) {
              context
                  .read<ZipDropdownMenuBloc>()
                  .add(ZipDropdownMenuEvent.cityChanged(value!));
            },
            items: _buildItems(context.read<ZipDropdownMenuBloc>().cities),
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildItems(List<String> cities) {
    return cities.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}

class DistrictDropdownButton extends StatelessWidget {
  const DistrictDropdownButton({this.onDistrictChanged, Key? key})
      : super(key: key);
  final void Function(String district)? onDistrictChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.district != current.district,
        builder: (context, state) {
          if (onDistrictChanged != null) {
            onDistrictChanged!(state.zipCode);
          }
          return DropdownButton<String>(
            value: state.district,
            key: const Key('ZipDropdownMenuView_district'),
            elevation: 12,
            onChanged: (String? value) {
              context
                  .read<ZipDropdownMenuBloc>()
                  .add(ZipDropdownMenuEvent.districtChanged(value!));
            },
            items: _buildItems(state.currentDistricts),
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildItems(List<String> districts) {
    return districts.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
