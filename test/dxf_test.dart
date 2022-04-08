import 'dart:math';

import 'package:dxf/dxf.dart';
import 'package:test/test.dart';

Future<void> main() async {
  // Create a DXF object
  final dxf = DXF.create();
  group('DXF', () {
    setUp(() {});
    test('creates entities instance', () async {
      var arc = AcDbArc(
        x: -3.4,
        y: 19.8,
        z: 0,
        radius: 4.5,
        startAngle: 297,
        endAngle: 40,
      );
      dxf.addEntities(arc);
      expect(arc.handle, '273');
      expect(dxf.getEntityByHandle('273').runtimeType, AcDbArc);

      var circle = AcDbCircle(
        x: 0.2,
        y: 12,
        z: 0,
        radius: 2.5,
      );
      dxf.addEntities(circle);
      expect(circle.handle, '274');
      expect(dxf.getEntityByHandle('274').runtimeType, AcDbCircle);

      var ellipse = AcDbEllipse(
        x: 5.4,
        y: 19,
        z: 0,
        xEndPoint: -1.6,
        yEndPoint: -0.8,
        zEndPoint: 0,
        ratioMajor: 0.5,
        start: 0,
        end: 2 * pi,
      );
      dxf.addEntities(ellipse);
      expect(ellipse.handle, '275');
      expect(dxf.getEntityByHandle('275').runtimeType, AcDbEllipse);

      var line = AcDbLine(
        x: 3.6,
        y: 14.3,
        x1: 8.08,
        y1: 15.3,
      );
      dxf.addEntities(line);
      expect(line.handle, '276');
      expect(dxf.getEntityByHandle('276').runtimeType, AcDbLine);

      var mtext = AcDbMText(
          x: 3.7,
          y: 12.3,
          z: 0,
          textHeight: 2.5,
          textString: 'Hello, xin chào',
          columnWidth: 12.9);
      dxf.addEntities(mtext);
      expect(mtext.handle, '277');
      expect(dxf.getEntityByHandle('277').runtimeType, AcDbMText);

      var point = AcDbPoint(x: -0.6, y: 8.3, z: 0);
      dxf.addEntities(point);
      expect(point.handle, '278');
      expect(dxf.getEntityByHandle('278').runtimeType, AcDbPoint);

      var vertices = <List<double>>[];
      vertices.addAll([
        [2.4, 21.1],
        [6.7, 22.6],
        [9.9, 21.7],
        [13.5, 22.6]
      ]);

      var polyline = AcDbPolyline(vertices: vertices, isClosed: false);
      dxf.addEntities(polyline);
      expect(polyline.handle, '279');
      expect(dxf.getEntityByHandle('279').runtimeType, AcDbPolyline);

      var text = AcDbText(
        x: 14.2,
        y: 16.7,
        textString: 'https://humg.edu.vn',
      );
      dxf.addEntities(text);
      expect(text.handle, '27a');
      expect(dxf.getEntityByHandle('27a').runtimeType, AcDbText);

      // Load string from ASCII DXF file
      final dxf1 = DXF.fromString(dxf.dxfString);
      var text1 = AcDbText(
        x: 18.2,
        y: 26.7,
        textString: 'DXF package',
      );
      dxf1.addEntities(text1);
      expect(text1.handle, '27b');
      expect(dxf1.getEntityByHandle('27b').runtimeType, AcDbText);
      print(dxf1.dxfString);
    });
  });
}
