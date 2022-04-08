part of dxf;

/// SOLID (DXF)
///
/// Subclass marker (AcDbSolid)
class AcDbSolid implements AcDbEntity {
  AcDbSolid._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

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

  /// Second corner X
  set x1(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 11);
    _x1 = value;
    result.value = value;
  }

  double _y1 = 0;
  double get y1 => _y1;

  /// Second corner Y
  set y1(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 21);
    _y1 = value;
    result.value = value;
  }

  double _z1 = 0;
  double get z1 => _z1;

  /// Second corner Z
  set z1(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 31);
    _z1 = value;
    result.value = value;
  }

  double _x2 = 0;
  double get x2 => _x2;

  /// Third corner X
  set x2(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 12);
    _x2 = value;
    result.value = value;
  }

  double _y2 = 0;
  double get y2 => _y2;

  /// Third corner Y
  set y2(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 22);
    _y2 = value;
    result.value = value;
  }

  double _z2 = 0;
  double get z2 => _z2;

  /// Third corner Z
  set z2(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 32);
    _z2 = value;
    result.value = value;
  }

  double _x3 = 0;
  double get x3 => _x3;

  /// Fourth corner X
  set x3(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 13);
    _x3 = value;
    result.value = value;
  }

  double _y3 = 0;
  double get y3 => _y3;

  /// Fourth corner Y
  set y3(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 23);
    _y3 = value;
    result.value = value;
  }

  double _z3 = 0;
  double get z3 => _z3;

  /// Fourth corner Z
  set z3(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 33);
    _z3 = value;
    result.value = value;
  }

  factory AcDbSolid._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbSolid._init();
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
      result = codes.firstWhere((element) => element.code == 12);
      _acDbEntity._x2 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 22);
      _acDbEntity._y2 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 32);
      _acDbEntity._z2 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 13);
      _acDbEntity._x3 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 23);
      _acDbEntity._y3 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 33);
      _acDbEntity._z3 = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  /// Create AcDbSolid entity.
  AcDbSolid({
    double x = 0,
    double y = 0,
    double z = 0,
    double x1 = 0,
    double y1 = 0,
    double z1 = 0,
    double x2 = 0,
    double y2 = 0,
    double z2 = 0,
    double x3 = 0,
    double y3 = 0,
    double z3 = 0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _x1 = x1,
        _y1 = y1,
        _z1 = z1,
        _x2 = x2,
        _y2 = y2,
        _z2 = z2,
        _x3 = x3,
        _y3 = y3,
        _z3 = z3,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'SOLID'));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbTrace'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(11, x1));
    _groupCodes.add(GroupCode(21, y1));
    _groupCodes.add(GroupCode(31, z1));
    _groupCodes.add(GroupCode(12, x2));
    _groupCodes.add(GroupCode(22, y2));
    _groupCodes.add(GroupCode(32, z2));
    _groupCodes.add(GroupCode(13, x3));
    _groupCodes.add(GroupCode(23, y3));
    _groupCodes.add(GroupCode(33, z3));
  }
}
