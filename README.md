# DXF package for Dart developers

DXF package for Dart developers to create, read, update and delete the data in AutoCAD DXF file - a CAD data file format developed by Autodesk.

## Usage

A simple usage example:

```dart
import 'package:dxf/dxf.dart';

void main() {
  var launchTime = DateTime.now();
  DXF.load('example/data/r18.dxf').then((DXF dxf) {
    dxf.save(newPath: 'example/data/r18s.dxf');
    print(DateTime.now().difference(launchTime));
  });
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/chuyentt/dxf/issues
