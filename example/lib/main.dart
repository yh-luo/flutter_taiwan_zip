import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taiwan_zip/flutter_taiwan_zip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_taiwan_zip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taiwan Zip Code'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: const <Widget>[
                Text(
                  'Default menu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ZipDropdownMenu(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: const <Widget>[
                Text(
                  'Customized menu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CustomizedMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Create a customized dropdown menu
class CustomizedMenu extends StatelessWidget {
  const CustomizedMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZipDropdownMenu(
      zipWidget: _buildZip(),
      cityWidget: _buildCity(),
      districtWidget: _buildDistrict(),
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
            value: state.city,
            key: const Key('ZipDropdownMenuView_city'),
            elevation: 12,
            onChanged: (String? value) {
              context.read<ZipDropdownMenuBloc>().add(CityChanged(value!));
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
            value: state.district,
            key: const Key('ZipDropdownMenuView_district'),
            elevation: 12,
            onChanged: (String? value) {
              context.read<ZipDropdownMenuBloc>().add(DistrictChanged(value!));
            },
            items: _buildDistrictItems(
                context.read<ZipDropdownMenuBloc>().state.currentDistricts),
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
