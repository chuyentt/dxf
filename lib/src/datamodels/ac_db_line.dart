import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbLine implements AcDbEntity {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbLine._init(this._handle);
  static Future<AcDbLine> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbLine._init(handle);
    _acDbEntity._groupCodes.addAll(codes);

    result =
        codes.firstWhere((element) => element.code == 10, orElse: () => null);
    if (result != null) {
      _acDbEntity._x = double.parse(result.value);
    }

    result =
        codes.firstWhere((element) => element.code == 20, orElse: () => null);
    if (result != null) {
      _acDbEntity._y = double.parse(result.value);
    }

    result =
        codes.firstWhere((element) => element.code == 30, orElse: () => null);
    if (result != null) {
      _acDbEntity._z = double.parse(result.value);
    }

    result =
        codes.lastWhere((element) => element.code == 10, orElse: () => null);
    if (result != null) {
      _acDbEntity._x1 = double.parse(result.value);
    }

    result =
        codes.lastWhere((element) => element.code == 20, orElse: () => null);
    if (result != null) {
      _acDbEntity._y1 = double.parse(result.value);
    }

    result =
        codes.lastWhere((element) => element.code == 30, orElse: () => null);
    if (result != null) {
      _acDbEntity._z1 = double.parse(result.value);
    }

    result =
        codes.firstWhere((element) => element.code == 8, orElse: () => null);
    if (result != null) {
      _acDbEntity._layerName = result.value;
    }

    return _acDbEntity;
  }

  AcDbLine(this._handle,
      {double x = 0,
      double y = 0,
      double z = 0,
      double x1 = 0,
      double y1 = 0,
      double z1 = 0,
      String layerName = '0'})
      : _x = x,
        _y = y,
        _z = z,
        _x1 = x1,
        _y1 = y1,
        _z1 = z1,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'LINE'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbLine'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(11, x1));
    _groupCodes.add(GroupCode(21, y1));
    _groupCodes.add(GroupCode(31, z1));
  }

  double _x = 0;
  double get x => _x;
  set x(double value) {
    var result = _groupCodes.firstWhere((element) => element.code == 10,
        orElse: () => null);
    if (result != null) {
      _x = value;
      result.value = value;
    }
  }

  double _y = 0;
  double get y => _y;
  set y(double value) {
    var result = _groupCodes.firstWhere((element) => element.code == 20,
        orElse: () => null);
    if (result != null) {
      _y = value;
      result.value = value;
    }
  }

  double _z = 0;
  double get z => _z;
  set z(double value) {
    var result = _groupCodes.firstWhere((element) => element.code == 30,
        orElse: () => null);
    if (result != null) {
      _z = value;
      result.value = value;
    }
  }

  double _x1 = 0;
  double get x1 => _x1;
  set x1(double value) {
    var result = _groupCodes.lastWhere((element) => element.code == 10,
        orElse: () => null);
    if (result != null) {
      _x1 = value;
      result.value = value;
    }
  }

  double _y1 = 0;
  double get y1 => _y1;
  set y1(double value) {
    var result = _groupCodes.lastWhere((element) => element.code == 20,
        orElse: () => null);
    if (result != null) {
      _y1 = value;
      result.value = value;
    }
  }

  double _z1 = 0;
  double get z1 => _z1;
  set z1(double value) {
    var result = _groupCodes.lastWhere((element) => element.code == 30,
        orElse: () => null);
    if (result != null) {
      _z1 = value;
      result.value = value;
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
    return str;
  }

  @override
  int get handle => _handle;
}
