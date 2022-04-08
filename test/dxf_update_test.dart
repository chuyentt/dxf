import 'dart:io';

import 'package:dxf/dxf.dart';
import 'package:test/test.dart';

Future<void> main() async {
  group('DXF', () {
    setUp(() {});
    test('update DXF entity in ASCII file', () async {
      final file = new File('test_resources/1.dxf');
      final dxf = DXF.fromString(file.readAsStringSync());
      AcDbEntity text =
          dxf.entities.where((e) => e.runtimeType == AcDbText).first;
      if (text is AcDbText) {
        text.textString = 'https://humg.edu.vn/Pages/home.aspx';
        final handle = text.handle;
        final entity = dxf.getEntityByHandle(handle) as AcDbText;
        expect(entity.textString, text.textString);
      }
    });
  });
}
