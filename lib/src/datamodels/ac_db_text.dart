part of dxf;

/// TEXT (DXF)
///
/// Subclass marker (AcDbText)
class AcDbText implements AcDbEntity {
  AcDbText._();

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

  String _textString = 'Title';
  String get textString => _textString;
  set textString(String value) {
    final result = groupCodes.firstWhere((element) => element.code == 1);
    _textString = value;
    result.value = value;
  }

  double _textHeight = 2.5;
  double get textHeight => _textHeight;
  set textHeight(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 40);
    _textHeight = value;
    result.value = value;
  }

  factory AcDbText.fromGroupCodes(List<GroupCode> codes) {
    final _acDbEntity = AcDbText._();
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
      result = codes.firstWhere((element) => element.code == 1);
      _acDbEntity._textString = result.value;
      result = codes.firstWhere((element) => element.code == 40);
      _acDbEntity._textHeight = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  AcDbText({
    double x = 0,
    double y = 0,
    double z = 0,
    String textString = '',
    double textHeight = 2.5,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _textString = textString,
        _textHeight = textHeight,
        _layerName = layerName {
    groupCodes.add(GroupCode(0, 'TEXT'));
    groupCodes.add(GroupCode(5, handle));
    groupCodes.add(GroupCode(330, '1F'));
    groupCodes.add(GroupCode(100, 'AcDbEntity'));
    groupCodes.add(GroupCode(8, layerName));
    groupCodes.add(GroupCode(100, 'AcDbText'));
    groupCodes.add(GroupCode(10, x));
    groupCodes.add(GroupCode(20, y));
    groupCodes.add(GroupCode(30, z));
    groupCodes.add(GroupCode(40, textHeight));
    groupCodes.add(GroupCode(1, textString));
    groupCodes.add(GroupCode(100, 'AcDbText'));
  }
}
