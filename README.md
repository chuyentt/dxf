# DXF package for Dart and Flutter developers

[![pub package](https://img.shields.io/pub/v/dxf.svg)](https://pub.dartlang.org/packages/dxf)

DXF package for Dart developers to create, read, update and delete the data in AutoCAD DXF file - a CAD data file format developed by Autodesk.

## Usage

A simple usage example:

```dart
import 'package:dxf/dxf.dart';

void main() {
  final dxf = DXF.create();
  // or dxf = DXF.fromString(dxfString);
  var arc = AcDbArc(
    x: -3.4,
    y: 19.8,
    z: 0,
    radius: 4.5,
    startAngle: 297,
    endAngle: 40,
  );
  dxf.addEntities(arc);

  var circle = AcDbCircle(
    x: 0.2,
    y: 12,
    z: 0,
    radius: 2.5,
  );
  dxf.addEntities(circle);

  var ellipse = AcDbEllipse(
    x: 5.4,
    y: 19,
    z: 0,
    x_endPoint: -1.6,
    y_endPoint: -0.8,
    z_endPoint: 0,
    ratioMajor: 0.5,
    start: 0,
    end: 2 * pi,
  );
  dxf.addEntities(ellipse);

  var line = AcDbLine(
    x: 3.6,
    y: 14.3,
    x1: 8.08,
    y1: 15.3,
  );
  dxf.addEntities(line);

  var mtext = AcDbMText(
      x: 3.7,
      y: 12.3,
      z: 0,
      textHeight: 2.5,
      textString: 'Hello, xin chào',
      columnWidth: 12.9);
  dxf.addEntities(mtext);

  var point = AcDbPoint(x: -0.6, y: 8.3, z: 0);
  dxf.addEntities(point);

  var vertices = <List<double>>[];
  vertices.addAll([
    [2.4, 21.1],
    [6.7, 22.6],
    [9.9, 21.7],
    [13.5, 22.6]
  ]);

  var polyline = AcDbPolyline(vertices: vertices, isClosed: false);
  dxf.addEntities(polyline);

  var text = AcDbText(
    x: 14.2,
    y: 16.7,
    textString: 'https://humg.edu.vn',
  );
  dxf.addEntities(text);

  print(dxf.dxfString);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/chuyentt/dxf/issues
