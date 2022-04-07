part of dxf;

/// CIRCLE (DXF)
///
/// Subclass marker (AcDbCircle)
class AcDbCircle implements AcDbEntity {
  AcDbCircle._();

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

  double _radius = 0;
  double get radius => _radius;
  set radius(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 40);
    _radius = value;
    result.value = value;
  }

  factory AcDbCircle.fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbCircle._();
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
      _acDbEntity._radius = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  /// Create AcDbCircle entity.
  AcDbCircle({
    double x = 0,
    double y = 0,
    double z = 0,
    double radius = 0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _radius = radius,
        _layerName = layerName {
    groupCodes.add(GroupCode(0, 'CIRCLE'));
    groupCodes.add(GroupCode(5, handle));
    groupCodes.add(GroupCode(330, '1F'));
    groupCodes.add(GroupCode(100, 'AcDbEntity'));
    groupCodes.add(GroupCode(8, layerName));
    groupCodes.add(GroupCode(100, 'AcDbCircle'));
    groupCodes.add(GroupCode(10, x));
    groupCodes.add(GroupCode(20, y));
    groupCodes.add(GroupCode(30, z));
    groupCodes.add(GroupCode(40, radius));
  }
}
