# flutter_taiwan_zip

![coverage][coverage_badge]

藉由下拉式選單輸入縣市與行政區，快速查詢臺灣現行郵遞區號。

## 特色

核心 package 為 `taiwan_zip` ([repository](https://github.com/yh-luo/taiwan_zip), [pub.dev](https://pub.dev/packages/taiwan_zip))，`flutter_taiwan_zip` 提供了基於 [BLoC](https://bloclibrary.dev/#/) 建構的下拉式選單。

* 預設的下拉式選單，供使用者選擇縣市與行政區
* 根據使用者所選的縣市、行政區，回傳對應的郵遞區號
* BLoC
* 可自定義下拉式選單

## 範例

![demo](resources/demo.gif)

## 安裝

* 作為 dependencies，從 GitHub 下載使用

  ```
  flutter pub add flutter_taiwan_zip --git-url https://github.com/yh-luo/flutter_taiwan_zip.git
  ```
  
  `pubspec.yaml` 會增加 `flutter_taiwan_zip`

  ```yaml
  dependencies:
    flutter:
      sdk: flutter
  
    flutter_taiwan_zip: 
      git: https://github.com/yh-luo/flutter_taiwan_zip.git
  ```

  下載到本地端

  ```
  flutter pub get
  ```

* 下載後直接使用程式碼 (遵守 MIT license，見 `LICENSE`)
  ```
  git clone https://github.com/yh-luo/flutter_taiwan_zip.git
  ```

## FAQ

#### Q: 一定要用 bloc 才能使用嗎？

理論上是，因為此插件 dependencies 包含 `bloc` ，雖然不會直接列為 dependencies，但使用後 `pubspec.lock` 會出現 `bloc` 等等 transitive packages 。但專案不需要使用 bloc 設計模式，也可以直接利用 callback functions 使用 `ZipDropdownMenu`。

如果不想使 dependencies 變複雜，可以使用 Dart package [taiwan_zip](https://pub.dev/packages/taiwan_zip) 來取得郵遞區號，利用 Stateful widget （或其他）完成相同目的，不需要使用此插件。請參考 `stateful_menu.dart`。

#### Q: 我可以在我的商用 app 使用嗎？需要授權嗎？

可以，只要遵守 MIT license 即可：使用時請保留著作權宣言 (`LICENSE`)，如果因為用了此專案造成電腦故障、主管生氣、世界毀滅等等可避免或不可避免的傷害，都與作者無關。

#### Q: 我想要 XXX 功能，你可以增加嗎？

可以提 issue 討論，更新時間不定。

[coverage_badge]: ./coverage_badge.svg