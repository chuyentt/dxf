part of dxf;

/// ELIPSE (DXF)
///
/// Subclass marker (AcDbEllipse)
class AcDbEllipse implements AcDbEntity {
  AcDbEllipse._();

  @override
  List<GroupCode> groupCodes = <GroupCode>[];

  @override
  String get dxfString => groupCodes.expand((e) => [e.dxfString]).join();

  @override
  String _handle = '190';

  @override
  String get handle => _handle;

  @override
  set handle(value) {
    final result = groupCodes.firstWhere((element) => element.code == 5);
    result.value = value;
    _handle = value;
  }

  @override
  String _layerName = '0';

  @override
  String get layerName => _layerName;

  @override
  set layerName(String value) {
    final result = groupCodes.firstWhere((element) => element.code == 8);
    _layerName = value;
    result.value = value;
  }

  double _x = 0;
  double get x => _x;
  set x(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 10);
    _x = value;
    result.value = value;
  }

  double _y = 0;
  double get y => _y;
  set y(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 20);
    _y = value;
    result.value = value;
  }

  double _z = 0;
  double get z => _z;
  set z(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 30);
    _z = value;
    result.value = value;
  }

  double _ratioMajor = 0;
  double get radius => _ratioMajor;
  set ratioMajor(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 40);
    _ratioMajor = value;
    result.value = value;
  }

  double _x_endPoint = 0;
  double get x_endPoint => _x_endPoint;
  set x_endPoint(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 11);
    _x_endPoint = value;
    result.value = value;
  }

  double _y_endPoint = 0;
  double get y_endPoint => _y_endPoint;
  set y_endPoint(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 21);
    _y_endPoint = value;
    result.value = value;
  }

  double _z_endPoint = 0;
  double get z_endPoint => _z_endPoint;
  set z_endPoint(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 31);
    _z_endPoint = value;
    result.value = value;
  }

  double _start = 0;
  double get start => _start;
  set start(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 41);
    _start = value;
    result.value = value;
  }

  double _end = 0;
  double get end => _end;
  set end(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 42);
    _end = value;
    result.value = value;
  }

  factory AcDbEllipse.fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbEllipse._();
    _acDbEntity.groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity.handle = result.value;
      result = codes.firstWhere((element) => element.code == 10);
      _acDbEntity._x = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 20);
      _acDbEntity._y = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 30);
      _acDbEntity._z = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 40);
      _acDbEntity._ratioMajor = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 11);
      _acDbEntity._x_endPoint = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 21);
      _acDbEntity._y_endPoint = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 31);
      _acDbEntity._z_endPoint = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 41);
      _acDbEntity._start = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 42);
      _acDbEntity._end = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  /// Create Ellipse entity.
  AcDbEllipse({
    double x = 0,
    double y = 0,
    double z = 0,
    double ratioMajor = 0,
    double start = 0,
    end = 0,
    double x_endPoint = 0,
    double y_endPoint = 0,
    double z_endPoint = 0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _ratioMajor = ratioMajor,
        _x_endPoint = x_endPoint,
        _y_endPoint = y_endPoint,
        _z_endPoint = z_endPoint,
        _start = start,
        _end = end,
        _layerName = layerName {
    groupCodes.add(GroupCode(0, 'ELLIPSE'));
    groupCodes.add(GroupCode(5, handle));
    groupCodes.add(GroupCode(330, '1F'));
    groupCodes.add(GroupCode(100, 'AcDbEntity'));
    groupCodes.add(GroupCode(8, layerName));
    groupCodes.add(GroupCode(100, 'AcDbEllipse'));
    groupCodes.add(GroupCode(10, x));
    groupCodes.add(GroupCode(20, y));
    groupCodes.add(GroupCode(30, z));
    groupCodes.add(GroupCode(40, ratioMajor));
    groupCodes.add(GroupCode(41, start));
    groupCodes.add(GroupCode(42, end));
    groupCodes.add(GroupCode(11, x_endPoint));
    groupCodes.add(GroupCode(21, y_endPoint));
    groupCodes.add(GroupCode(31, z_endPoint));
  }
}
