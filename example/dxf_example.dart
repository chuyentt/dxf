import 'package:dxf/dxf.dart';

void main() {
  var dxf = DXF.create('example/data/new.dxf');
  print('path: ${dxf.path}');
}
