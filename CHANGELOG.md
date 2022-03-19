# 0.5.1

**Fix**

* Fix version in `pubspec.yaml`.

**Enhancement**

* Removed "plugin" (插件) from `README.md`.

# 0.5.0

**New**

* `ZipDropdownMenu` now accepts `onCityChanged` and `onDistrictChanged` callback functions.

**Enhancement**

* Remove crufts in tests.
* Better documentation.
* A more detailed example.

# 0.4.0

**New**

* Minimum requirement of Dart SDK changed to 2.16.
* Updated `taiwan_zip` to 0.3.0.
* Used git lfs to manage resources.

# 0.3.0

**New**

* `ZipDropdownMenu` now accepts a `onZipCodeChanged` callback for changes of zip code. Zip codes can be used outside of the widget/bloc like:
    ```dart
    ZipDropdownMenu(
        onZipCodeChanged: (zipCode) {
          debugPrint('zip code changed to $zipCode');
        },
    )
    ```

**Enhancement**

* Migrated to [freezed](https://pub.dev/packages/freezed)
* 100% coverage

# 0.2.0

**Enhancement**

* Moved `BlocBuilder` to lower widgets in the widget tree.
* Added more tests.

**Fix**

* Fixed that `zipCode` was not compared between states.

# 0.1.0

* Initial development release