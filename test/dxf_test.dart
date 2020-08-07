import 'package:dxf/dxf.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    DXF dxf;

    setUp(() {
      //dxf = DXF.create('example/data/new.dxf');
    });

    test('First Test', () {
      expect(dxf.path, !null);
    });
  });
}
