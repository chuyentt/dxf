part of dxf;

/// ELIPSE (DXF)
///
/// Subclass marker (AcDbEllipse)
class AcDbEllipse implements AcDbEntity {
  AcDbEllipse._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'ELLIPSE';

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

  double _ratioMajor = 0;
  double get radius => _ratioMajor;
  set ratioMajor(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 40);
    _ratioMajor = value;
    result.value = value;
  }

  double _xEndPoint = 0;
  double get xEndPoint => _xEndPoint;
  set xEndPoint(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 11);
    _xEndPoint = value;
    result.value = value;
  }

  double _yEndPoint = 0;
  double get yEndPoint => _yEndPoint;
  set yEndPoint(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 21);
    _yEndPoint = value;
    result.value = value;
  }

  double _zEndPoint = 0;
  double get zEndPoint => _zEndPoint;
  set zEndPoint(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 31);
    _zEndPoint = value;
    result.value = value;
  }

  double _start = 0;
  double get start => _start;
  set start(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 41);
    _start = value;
    result.value = value;
  }

  double _end = 0;
  double get end => _end;
  set end(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 42);
    _end = value;
    result.value = value;
  }

  factory AcDbEllipse._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbEllipse._init();
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
      result = codes.firstWhere((element) => element.code == 40);
      _acDbEntity._ratioMajor = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 11);
      _acDbEntity._xEndPoint = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 21);
      _acDbEntity._yEndPoint = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 31);
      _acDbEntity._zEndPoint = double.parse(result.value);
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
    double xEndPoint = 0,
    double yEndPoint = 0,
    double zEndPoint = 0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _ratioMajor = ratioMajor,
        _xEndPoint = xEndPoint,
        _yEndPoint = yEndPoint,
        _zEndPoint = zEndPoint,
        _start = start,
        _end = end,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
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
    _groupCodes.add(GroupCode(11, xEndPoint));
    _groupCodes.add(GroupCode(21, yEndPoint));
    _groupCodes.add(GroupCode(31, zEndPoint));
  }
}
