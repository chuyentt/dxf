part of dxf;

/// ELIPSE (DXF)
///
/// Subclass marker (AcDbEllipse)
class AcDbEllipse implements AcDbEntity {
  @override
  final List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  final int? _handle;

  AcDbEllipse._init(this._handle);
  static Future<AcDbEllipse> fromGroupCodes(List<GroupCode> codes) async {
    int? handle;
    var result = codes.firstWhereOrNull((element) => element.code == 5);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbEllipse._init(handle);
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

    result = codes.firstWhereOrNull((element) => element.code == 40);
    if (result != null) {
      _acDbEntity._ratioMajor = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 11);
    if (result != null) {
      _acDbEntity._x_endPoint = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 21);
    if (result != null) {
      _acDbEntity._y_endPoint = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 31);
    if (result != null) {
      _acDbEntity._z_endPoint = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 41);
    if (result != null) {
      _acDbEntity._start = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 42);
    if (result != null) {
      _acDbEntity._end = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 8);
    if (result != null) {
      _acDbEntity._layerName = result.value;
    }

    return _acDbEntity;
  }

  AcDbEllipse(this._handle,
      {double x = 0,
      double y = 0,
      double z = 0,
      double ratioMajor = 0,
      double start = 0,
      end = 0,
      double x_endPoint = 0,
      double y_endPoint = 0,
      double z_endPoint = 0,
      String layerName = '0'})
      : _x = x,
        _y = y,
        _z = z,
        _ratioMajor = ratioMajor,
        _x_endPoint = x_endPoint,
        _y_endPoint = y_endPoint,
        _z_endPoint = z_endPoint,
        _start = start,
        _end = end,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'ELLIPSE'));
    _groupCodes.add(GroupCode(5, handle!.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbEllipse'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(40, ratioMajor));
    _groupCodes.add(GroupCode(41, start));
    _groupCodes.add(GroupCode(42, end));
    _groupCodes.add(GroupCode(11, x_endPoint));
    _groupCodes.add(GroupCode(21, y_endPoint));
    _groupCodes.add(GroupCode(31, z_endPoint));
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

  double _ratioMajor = 0;
  double get ratioMajor => _ratioMajor;
  set ratioMajor(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 40);
    if (result != null) {
      _ratioMajor = value;
      result.value = value;
    }
  }

  double _x_endPoint = 0;
  double get x_endPoint => _x_endPoint;
  set x_endPoint(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 11);
    if (result != null) {
      _x_endPoint = value;
      result.value = value;
    }
  }

  double _y_endPoint = 0;
  double get y_endPoint => _y_endPoint;
  set y_endPoint(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 21);
    if (result != null) {
      _y_endPoint = value;
      result.value = value;
    }
  }

  double _z_endPoint = 0;
  double get z_endPoint => _z_endPoint;
  set z_endPoint(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 31);
    if (result != null) {
      _z_endPoint = value;
      result.value = value;
    }
  }

  double _start = 0;
  double get start => _start;
  set start(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 41);
    if (result != null) {
      _start = value;
      result.value = value;
    }
  }

  double _end = 0;
  double get end => _end;
  set end(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 42);
    if (result != null) {
      _end = value;
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
