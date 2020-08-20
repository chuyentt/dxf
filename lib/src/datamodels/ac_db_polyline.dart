import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbPolyline implements AcDbEntity {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbPolyline._init(this._handle);
  static Future<AcDbPolyline> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbPolyline._init(handle);
    _acDbEntity._groupCodes.addAll(codes);

    result =
        codes.firstWhere((element) => element.code == 70, orElse: () => null);
    if (result != null) {
      _acDbEntity._isClosed = int.parse(result.value) == 1 ? true : false;
    }

    result =
        codes.firstWhere((element) => element.code == 8, orElse: () => null);
    if (result != null) {
      _acDbEntity._layerName = result.value;
    }

    codes.forEach((element) {
      if (element.code == 10) {
        _acDbEntity._vertices.add([double.parse(element.value)]);
        _acDbEntity._groupCodes.remove(element);
      } else if (element.code == 20) {
        _acDbEntity._vertices.last.add(double.parse(element.value));
        _acDbEntity._groupCodes.remove(element);
      }
    });
    return _acDbEntity;
  }

  AcDbPolyline(this._handle,
      {List<List<double>> vertices,
      bool isClosed = false,
      String layerName = '0'})
      : _vertices = vertices,
        _isClosed = isClosed,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'LWPOLYLINE'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbPolyline'));
    _groupCodes.add(GroupCode(90, vertices.length));
    _groupCodes.add(GroupCode(70, isClosed ? 1 : 0));
    _groupCodes.add(GroupCode(43, 0.0));
  }

  var _vertices = <List<double>>[];
  List<List<double>> get vertices => _vertices;
  set vertices(List<List<double>> value) {
    var result = _groupCodes.firstWhere((element) => element.code == 90,
        orElse: () => null);
    if (result != null) {
      result.value = value;
    }
    _vertices = value;
  }

  bool _isClosed = false;
  bool get isClosed => _isClosed;
  set isClosed(bool value) {
    var result = _groupCodes.firstWhere((element) => element.code == 70,
        orElse: () => null);
    if (result != null) {
      _isClosed = value;
      result.value = value ? 1 : 0;
    }
  }

  String _layerName = '0';
  String get layerName => _layerName;
  set layerName(String value) {
    var result = _groupCodes.firstWhere((element) => element.code == 8,
        orElse: () => null);
    if (result != null) {
      _layerName = value;
      result.value = value;
    }
  }

  @override
  String get dxfString {
    var str = '';
    _groupCodes.forEach((element) {
      str += element.dxfString;
    });
    _vertices?.forEach((vertext) {
      str += GroupCode(10, vertext[0]).dxfString;
      str += GroupCode(20, vertext[1]).dxfString;
    });
    return str;
  }

  @override
  int get handle => _handle;
}
