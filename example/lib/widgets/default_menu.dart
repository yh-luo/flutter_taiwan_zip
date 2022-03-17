import 'package:flutter/material.dart';

import 'package:flutter_taiwan_zip/flutter_taiwan_zip.dart';

class DefaultMenu extends StatelessWidget {
  const DefaultMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const Text(
            '預設選單',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ZipDropdownMenu(
            onZipCodeChanged: (zipCode) {
              debugPrint('zip code changed to $zipCode');
            },
          ),
        ],
      ),
    );
  }
}
