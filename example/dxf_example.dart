import 'package:dxf/dxf.dart';

void main() {
  // var launchTime = DateTime.now();
  // DXF.load('example/data/r18.dxf').then((DXF dxf) {
  //   dxf.save(newPath: 'example/data/r18s.dxf');
  //   print(DateTime.now().difference(launchTime));
  // });

  var dxf = DXF.create('example/data/new.dxf');
  print(dxf.dxfString);
}
