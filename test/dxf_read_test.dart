import 'dart:io';

import 'package:dxf/dxf.dart';
import 'package:test/test.dart';

Future<void> main() async {
  group('DXF', () {
    setUp(() {});
    test('read DXF from ASCII file', () async {
      final file = new File('test_resources/0.dxf');
      final dxf = DXF.fromString(file.readAsStringSync());
      final entities = dxf.entities.where((e) => e.runtimeType == AcDbText);
      expect(entities.length, 2);
    });
  });
}
