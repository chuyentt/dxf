part of dxf;

class AcDbPoint implements AcDbEntity {
  @override
  final List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  final int? _handle;
  AcDbPoint._init(this._handle);
  static Future<AcDbPoint> fromGroupCodes(List<GroupCode> codes) async {
    int? handle;
    var result = codes.firstWhereOrNull((element) => element.code == 5);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbPoint._init(handle);
    _acDbEntity._groupCodes.addAll(codes);

    result = codes.firstWhereOrNull((element) => element.code == 10);
    if (result != null) {
      _acDbEntity._x = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 20);
    if (result != null) {
      _acDbEntity._y = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 30);
    if (result != null) {
      _acDbEntity._z = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 8);
    if (result != null) {
      _acDbEntity._layerName = result.value;
    }

    return _acDbEntity;
  }

  AcDbPoint(this._handle,
      {double x = 0, double y = 0, double z = 0, String layerName = '0'})
      : _x = x,
        _y = y,
        _z = z,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'POINT'));
    _groupCodes.add(GroupCode(5, handle!.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbPoint'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
  }

  double _x = 0;
  double get x => _x;
  set x(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 10);
    if (result != null) {
      _x = value;
      result.value = value;
    }
  }

  double _y = 0;
  double get y => _y;
  set y(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 20);
    if (result != null) {
      _y = value;
      result.value = value;
    }
  }

  double _z = 0;
  double get z => _z;
  set z(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 30);
    if (result != null) {
      _z = value;
      result.value = value;
    }
  }

  String _layerName = '0';
  String get layerName => _layerName;
  set layerName(String value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 8);
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
  int? get handle => _handle;
}
