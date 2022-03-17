/// Create a customized dropdown menu
///
/// The widgets are built using bloc.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taiwan_zip/flutter_taiwan_zip.dart';

class CustomizedMenu extends StatelessWidget {
  const CustomizedMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const Text(
            '自訂選單',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ZipDropdownMenu(
            zipWidget: _buildZip(),
            cityWidget: _buildCity(),
            districtWidget: _buildDistrict(),
          ),
        ],
      ),
    );
  }

  Widget _buildZip() {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.zipCode != current.zipCode,
        builder: (context, state) {
          return Text(
            state.zipCode,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red.shade400,
            ),
          );
        },
      ),
    );
  }

  Widget _buildCity() {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.city != current.city,
        builder: (context, state) {
          return DropdownButton<String>(
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.red.shade400,
            ),
            underline: Container(
              height: 2,
              color: Colors.red.shade400,
            ),
            value: state.city,
            key: const Key('ZipDropdownMenuView_city'),
            elevation: 12,
            onChanged: (String? value) {
              context
                  .read<ZipDropdownMenuBloc>()
                  .add(ZipDropdownMenuEvent.cityChanged(value!));
            },
            items: _buildCityItems(context.read<ZipDropdownMenuBloc>().cities),
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildCityItems(List<String> cities) {
    return cities.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  Widget _buildDistrict() {
    return Padding(
      padding: padding,
      child: BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
        buildWhen: (previous, current) => previous.district != current.district,
        builder: (context, state) {
          debugPrint('District: ${state.city + state.district}'
              ', zip code: ${state.zipCode}');
          return DropdownButton<String>(
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.red.shade400,
            ),
            underline: Container(
              height: 2,
              color: Colors.red.shade400,
            ),
            value: state.district,
            key: const Key('ZipDropdownMenuView_district'),
            elevation: 12,
            onChanged: (String? value) {
              context
                  .read<ZipDropdownMenuBloc>()
                  .add(ZipDropdownMenuEvent.districtChanged(value!));
            },
            items: _buildDistrictItems(state.currentDistricts),
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDistrictItems(List<String> districts) {
    return districts.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
