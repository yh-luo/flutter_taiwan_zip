import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../zip_dropdown_menu.dart';

const EdgeInsets padding = EdgeInsets.all(5.0);

class ZipDropdownMenu extends StatelessWidget {
  const ZipDropdownMenu(
      {this.zipWidget, this.cityWidget, this.districtWidget, Key? key})
      : super(key: key);

  final Widget? zipWidget;
  final Widget? cityWidget;
  final Widget? districtWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ZipDropdownMenuBloc(),
      child: ZipDropdownMenuView(
        zipWidget: zipWidget,
        cityWidget: cityWidget,
        districtWidget: districtWidget,
      ),
    );
  }
}

class ZipDropdownMenuView extends StatelessWidget {
  const ZipDropdownMenuView(
      {this.zipWidget, this.cityWidget, this.districtWidget, Key? key})
      : super(key: key);

  final Widget? zipWidget;
  final Widget? cityWidget;
  final Widget? districtWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
        zipWidget ?? const ZipField(),
        cityWidget ?? const CityDropdownButton(),
        districtWidget ?? const DistrictDropdownButton(),
      ],
    );
  }
}

class ZipField extends StatelessWidget {
  const ZipField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.zipCode != current.zipCode,
        builder: (context, state) {
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
  const CityDropdownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.city != current.city,
        builder: (context, state) {
          return DropdownButton<String>(
            value: state.city,
            key: const Key('ZipDropdownMenuView_city'),
            elevation: 12,
            onChanged: (String? value) {
              context.read<ZipDropdownMenuBloc>().add(CityChanged(value!));
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
  const DistrictDropdownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.district != current.district,
        builder: (context, state) {
          return DropdownButton<String>(
            value: state.district,
            key: const Key('ZipDropdownMenuView_district'),
            elevation: 12,
            onChanged: (String? value) {
              context.read<ZipDropdownMenuBloc>().add(DistrictChanged(value!));
            },
            items: _buildItems(
                context.read<ZipDropdownMenuBloc>().state.currentDistricts),
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
