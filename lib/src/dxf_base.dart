import 'dart:io';

abstract class DXF {
  String _path;
  String get path => _path;

  static DXF create(String path) {
    var dxf = _DXF();
    dxf._path = path;

    return dxf;
  }

  static Future<DXF> load(String path) async {
    var dxf = _DXF();
    dxf._path = path;

    return dxf;
  }

  Future<File> save({String newPath}) async {
    var filePath = newPath ?? path;
    var file = File(filePath);
    // Write the file.
    return file.writeAsString(toString());
  }
}

class _DXF extends DXF {}