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
      zipWidget: _buildZip(context),
      cityWidget: _buildCity(context),
      districtWidget: _buildDistrict(context),
    );
  }

  Widget _buildZip(BuildContext context) {
    return BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
      builder: (context, state) {
        return Padding(
          padding: padding,
          child: Text(
            state.zipCode,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red.shade400,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCity(BuildContext context) {
    return BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
      buildWhen: (previous, current) => previous.city != current.city,
      builder: (context, state) {
        return Padding(
          padding: padding,
          child: DropdownButton<String>(
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
            items: _buildCityItems(context),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _buildCityItems(BuildContext context) {
    final cities = context.read<ZipDropdownMenuBloc>().cities;
    return cities.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  Widget _buildDistrict(BuildContext context) {
    return BlocBuilder<ZipDropdownMenuBloc, ZipDropdownMenuState>(
      builder: (context, state) {
        return Padding(
          padding: padding,
          child: DropdownButton<String>(
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
            items: _buildDistrictItems(context),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDistrictItems(BuildContext context) {
    final districts =
        context.read<ZipDropdownMenuBloc>().state.currentDistricts;
    return districts.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
