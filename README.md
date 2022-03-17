# flutter_taiwan_zip

藉由下拉式選單輸入縣市與行政區，快速查詢臺灣現行郵遞區號。

## 特色

核心 package 為 `taiwan_zip` ([repository](https://github.com/yh-luo/taiwan_zip), [pub.dev](https://pub.dev/packages/taiwan_zip))，`flutter_taiwan_zip` 提供了基於 [BLoC](https://bloclibrary.dev/#/) 建構的下拉式選單。

* 預設的下拉式選單，供使用者選擇縣市與行政區
* 根據使用者所選的縣市、行政區，回傳對應的郵遞區號
* BLoC
* 可自定義下拉式選單

## 範例

跟一般 stateless widget 一樣的用法！
* `example/` 內有自定義選單的範例

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

理論上是，因為此專案 dependencies 包含 `bloc` ，雖然不會直接列為 dependencies，但使用後 `pubspec.lock` 會出現 `bloc` 等等 packages，不過不需要使用 bloc 設計模式也能使用此專案。

```
  bloc:
    dependency: transitive
    description:
      name: bloc
      url: "https://pub.dartlang.org"
    source: hosted
    version: "8.0.3"
```

#### Q: 我可以在我的商用 app 使用嗎？需要授權嗎？

可以，只要遵守 MIT license 即可：使用時請保留著作權宣言 (`LICENSE`)，如果因為用了此專案造成電腦故障、主管生氣、世界毀滅等等可避免或不可避免的傷害，都與作者無關。

#### Q: 我想要 XXX 功能，你可以增加嗎？

歡迎提 issue 討論，更新時間不定。
