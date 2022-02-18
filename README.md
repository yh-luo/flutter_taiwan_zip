藉由下拉式選單輸入縣市與行政區，快速查詢臺灣現行郵遞區號。

## 特色

核心 package 為 [`taiwan_zip`](https://github.com/yh-luo/taiwan_zip)，`flutter_taiwan_zip` 提供了基於 [BLoC](https://bloclibrary.dev/#/) 建構的下拉式選單。

* 預設的下拉式選單，供使用者選擇縣市與行政區
* 根據使用者所選的縣市、行政區，回傳對應的郵遞區號
* BLoC
* 可自定義下拉式選單

## 範例

跟一般 stateless widget 一樣的用法！
* `example/` 內有自定義選單的範例

```dart
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
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ZipDropdownMenu(),
      ),
    );
  }
```