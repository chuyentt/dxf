import 'package:dxf/dxf.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final dxf = await DXF.create('example/data/new.dxf');
  group('DXF', () {
    setUp(() {});

    test('creates AcDbPoint instance', () async {
      var point = AcDbPoint(dxf.nextHandle, x: 10, y: 10.5);
      dxf.entities.add(point);

      expect(point.x, 10);
    });
  });
}
