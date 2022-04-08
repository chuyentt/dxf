import 'dart:io';

import 'package:dxf/dxf.dart';
import 'package:test/test.dart';

Future<void> main() async {
  group('DXF', () {
    setUp(() {});
    test('remove DXF entity in ASCII file', () async {
      final file = new File('test_resources/1.dxf');
      final dxf = DXF.fromString(file.readAsStringSync());
      AcDbEntity text =
          dxf.entities.where((e) => e.runtimeType == AcDbText).first;
      if (text is AcDbText) {
        final handle = text.handle;
        final result = dxf.removeEntity(text);
        final entity = dxf.getEntityByHandle(handle);
        expect(result, true);
        expect(entity, null);
      }
    });
  });
}
