import '../group_code.dart';
import 'ac_db_entity.dart';

/// Autocad Database Polyline
class AcDbPolyline extends AcDbEntity {
  AcDbPolyline({List<List<double>> vertices, bool isClosed = false}) {
    _vertices = vertices;
    _isClosed = isClosed;
    _nVertices = vertices != null ? vertices.length : 0;
    groupCodes.add(GroupCode(key: 90, value: nVertices));
    groupCodes.add(GroupCode(key: 70, value: isClosed ? 1 : 0));
    vertices?.forEach((vertext) {
      groupCodes.add(GroupCode(key: 10, value: vertext[0]));
      groupCodes.add(GroupCode(key: 20, value: vertext[1]));
    });
  }
  int _nVertices = 3;
  int get nVertices => _nVertices;

  bool _isClosed = false;
  bool get isClosed => _isClosed;

  var _vertices = <List<double>>[];
  List<List<double>> get vertices => _vertices;

  @override
  Future parse() {
    var result =
        groupCodes.firstWhere((code) => code.key == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);

    result =
        groupCodes.firstWhere((code) => code.key == 90, orElse: () => null);
    if (result != null) _nVertices = result.value;

    result =
        groupCodes.firstWhere((code) => code.key == 70, orElse: () => null);
    if (result != null) {
      _isClosed = result.value == 1 ? true : false;
    }

    return null;
  }

  @override
  String get dxfString {
    return '0\r\nLWPOLYLINE\r\n5\r\n${handle.toRadixString(16)}\r\n330\r\n1F\r\n100'
        '\r\nAcDbEntity\r\n8\r\n0\r\n100\r\nAcDbPolyline\r\n${super.dxfString}';
  }
}
// LWPOLYLINE
//   5
// 27F3
// 330
// 1F
// 100
// AcDbEntity
//   8
// 0
// 100
// AcDbPolyline
//  90
//         4
//  70
//      0
//  43
// 0.0
//  10
// 11.27882492329638
//  20
// 10.06054125049451
//  10
// 11.83733582655446
//  20
// 10.33642862264781
//  10
// 11.98846266808385
//  20
// 10.97359739211958
//  10
// 11.7190629531201
//  20
// 11.20350359852801
