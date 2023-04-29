part of dxf;

/// LINE (DXF)
///
/// Subclass marker (AcDbLine)
class AcDbLine implements AcDbEntity {
  AcDbLine._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'LINE';

  @override
  String get type => _type;

  @override
  String _handle = '190';

  @override
  String get handle => _handle;

  @override
  String _layerName = '0';

  @override
  String get layerName => _layerName;

  @override
  set layerName(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 8);
    _layerName = value;
    result.value = value;
  }

  double _x = 0;
  double get x => _x;
  set x(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 10);
    _x = value;
    result.value = value;
  }

  double _y = 0;
  double get y => _y;
  set y(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 20);
    _y = value;
    result.value = value;
  }

  double _z = 0;
  double get z => _z;
  set z(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 30);
    _z = value;
    result.value = value;
  }

  double _x1 = 0;
  double get x1 => _x1;
  set x1(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 11);
    _x1 = value;
    result.value = value;
  }

  double _y1 = 0;
  double get y1 => _y1;
  set y1(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 21);
    _y1 = value;
    result.value = value;
  }

  double _z1 = 0;
  double get z1 => _z1;
  set z1(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 31);
    _z1 = value;
    result.value = value;
  }

  factory AcDbLine._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbLine._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;
      result = codes.firstWhere((element) => element.code == 10);
      _acDbEntity._x = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 20);
      _acDbEntity._y = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 30);
      _acDbEntity._z = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 11);
      _acDbEntity._x1 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 21);
      _acDbEntity._y1 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 31);
      _acDbEntity._z1 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  /// Create AcDbLine entity.
  AcDbLine({
    double x = 0,
    double y = 0,
    double z = 0,
    double x1 = 0,
    double y1 = 0,
    double z1 = 0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _x1 = x1,
        _y1 = y1,
        _z1 = z1,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
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
}
