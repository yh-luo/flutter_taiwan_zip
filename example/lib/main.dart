import 'package:flutter/material.dart';
import 'package:flutter_taiwan_zip/flutter_taiwan_zip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Taiwan Zip',
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
        title: const Text('Taiwan Zip Code Dropdown Menu Demo'),
      ),
      body: const Center(
        child: ZipDropdownMenu(),
      ),
    );
  }
}
