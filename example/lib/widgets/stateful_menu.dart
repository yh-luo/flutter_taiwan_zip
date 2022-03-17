/// Only depends on `taiwan_zip` to create a customized dropdown menu.
///
/// The widgets do not depend on `flutter_taiwan_zip`. You can create vanilla
/// stateful widgets without using bloc or this package.
import 'package:flutter/material.dart';
import 'package:taiwan_zip/taiwan_zip.dart';

const EdgeInsets padding = EdgeInsets.all(5.0);

class StatefulMenu extends StatefulWidget {
  const StatefulMenu({Key? key}) : super(key: key);

  @override
  State<StatefulMenu> createState() => _StatefulMenuState();
}

class _StatefulMenuState extends State<StatefulMenu> {
  final List<String> cities = TaiwanZip.cities;
  late String city;
  late String zipCode;
  late String district;

  @override
  void initState() {
    super.initState();
    city = TaiwanZip.cities[0];
    district = TaiwanZip.getDistricts(city)[0];
    zipCode = TaiwanZip.toZip(city + district);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Stateful Widget',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              _buildZip(),
              _buildCity(),
              _buildDistrict(),
            ],
          ),
          _buildGreeting(),
        ],
      ),
    );
  }

  Widget _buildZip() {
    return Padding(
      padding: padding,
      child: Text(
        zipCode,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildCity() {
    return Padding(
      padding: padding,
      child: DropdownButton<String>(
        value: city,
        elevation: 12,
        onChanged: (String? value) {
          setState(() {
            city = value!;
            district = TaiwanZip.getDistricts(value)[0];
          });
        },
        items: _buildCityItems(),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildCityItems() {
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
      child: DropdownButton<String>(
        value: district,
        elevation: 12,
        onChanged: (String? value) {
          setState(() {
            district = value!;
            zipCode = TaiwanZip.toZip(city + value);
          });
        },
        items: _buildDistrictItems(),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDistrictItems() {
    final districts = TaiwanZip.getDistricts(city);
    return districts.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '$city$district居民你好！',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
