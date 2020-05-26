# DXF package for Dart developers

DXF package for Dart developers to create, read, update and delete the data in AutoCAD DXF file - a CAD data file format developed by Autodesk.

## Usage

A simple usage example:

```dart
import 'package:dxf/dxf.dart';

void main() {
  var dxf = DXF.create('example/data/new.dxf');
  print('path: ${dxf.path}');
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/chuyentt/dxf/issues
