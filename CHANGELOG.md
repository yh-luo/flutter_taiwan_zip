# 0.3.0

**New**

* ZipDropdownMenu now accepts a `onZipCodeChanged` callback for changes of zip code. Zip codes can be used outside of the widget/bloc like:
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