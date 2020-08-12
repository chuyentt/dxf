import 'package:dxf/dxf.dart';

Future<void> main() async {
  var dxf = await DXF.create('example/data/new.dxf');
  var point = AcDbPoint(dxf.nextHandle, x: 10, y: 10.5);
  dxf.addEntities(point);

  var line = AcDbLine(
    dxf.nextHandle,
    x: 12.2,
    y: 11.5,
    x1: 22.0,
    y1: 13.6,
  );
  dxf.addEntities(line);

  var vertices = <List<double>>[];
  vertices.addAll([
    [25, 11],
    [21, 18],
    [23, 23]
  ]);
  var pl = AcDbPolyline(
    dxf.nextHandle,
    vertices: vertices,
    isClosed: false,
  );
  dxf.addEntities(pl);
  pl.vertices.addAll([
    [24, 25]
  ]);

  var closedPl = AcDbPolyline(
    dxf.nextHandle,
    vertices: [
      [27, 20],
      [36, 20],
      [35, 14],
      [27, 14]
    ],
    isClosed: true,
  );

  dxf.addEntities(closedPl);
  var handle1 = dxf.nextHandle;
  var text = AcDbText(
    handle1,
    x: 11,
    y: 20,
    textString: 'Hello!',
  );
  dxf.addEntities(text);

  var handle = dxf.nextHandle;
  var mtext = AcDbMText(
    handle,
    x: 19,
    y: 7,
    textString: 'Hello!\\PXin chào!',
  );
  dxf.addEntities(mtext);

  print('Saving...');
  await dxf.save().then((_) {
    print('Saved!');
  });

  var e = dxf.getEntityByHandle(handle);
  dxf.removeEntity(e);

  var e1 = dxf.getEntityByHandle(handle1);
  if (e1 is AcDbText) {
    e1.textString = 'Trần Trung Chuyên';
  }

  dxf.addEntities(mtext);

  print('Saving...');
  await dxf.save().then((_) {
    print('Saved!');
  });

  dxf.entities.forEach((element) {
    print(element.dxfString);
  });

  print('Loading...');
  var dxfr18 = await DXF.load('example/data/r18.dxf');
  await dxfr18.save(newPath: 'example/data/r18s.dxf').then((value) {
    print('Saved!');
  });
}
