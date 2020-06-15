# DXF package for Dart and Flutter developers
[![pub package](https://img.shields.io/pub/v/dxf.svg)](https://pub.dartlang.org/packages/dxf)

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

```dart
import 'package:dxf/dxf.dart';

void main() {
  // var launchTime = DateTime.now();
  // DXF.load('example/data/r18.dxf').then((DXF dxf) {
  //   dxf.save(newPath: 'example/data/r18s.dxf');
  //   print(DateTime.now().difference(launchTime));
  // });

  var dxf = DXF.create('example/data/new.dxf');
  
  var p = AcDbPoint(x: 10, y: 10.5);
  
  dxf.entities.points.add(p);
  var l = AcDbLine(x: 10.1, y: 10.1, z: 10.1, x1: 10.2, y1: 10.2, z1: 10.2);
  dxf.entities.lines.add(l);

  var t = AcDbText(x: 10.1, y: 10.1, z: 10.1, value: 'Xin chào');
  dxf.entities.texts.add(t);
  
  var vertices = <List<double>>[];
  vertices.addAll([[10.0,11.0], [10.2, 11.2], [10.4,10.3]]);

  var pl = AcDbPolyline(vertices: vertices, isClosed: true);
  dxf.entities.polylines.add(pl);
  //print(dxf.dxfString);
  dxf.save();
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/chuyentt/dxf/issues
