part of dxf;

/// MTEXT (DXF)
///
/// Subclass marker (AcDbMText)
class AcDbMText implements AcDbEntity {
  AcDbMText._();

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

  double _columnWidth = 2.5;
  double get columnWidth => _columnWidth;
  set columnWidth(double value) {
    final result = groupCodes.firstWhere((element) => element.code == 41);
    _columnWidth = value;
    result.value = value;
  }

  factory AcDbMText.fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbMText._();
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
      result = codes.firstWhere((element) => element.code == 41);
      _acDbEntity._columnWidth = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  /// Create AcDbMText entity.
  AcDbMText({
    double x = 0,
    double y = 0,
    double z = 0,
    String textString = '',
    double textHeight = 2.5,
    double columnWidth = 20.0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _textString = textString,
        _textHeight = textHeight,
        _columnWidth = columnWidth,
        _layerName = layerName {
    groupCodes.add(GroupCode(0, 'MTEXT'));
    groupCodes.add(GroupCode(5, handle));
    groupCodes.add(GroupCode(330, '1F'));
    groupCodes.add(GroupCode(100, 'AcDbEntity'));
    groupCodes.add(GroupCode(8, layerName));
    groupCodes.add(GroupCode(100, 'AcDbMText'));
    groupCodes.add(GroupCode(10, x));
    groupCodes.add(GroupCode(20, y));
    groupCodes.add(GroupCode(30, z));
    groupCodes.add(GroupCode(40, textHeight));
    groupCodes.add(GroupCode(41, columnWidth));
    groupCodes.add(GroupCode(46, 0.0));
    groupCodes.add(GroupCode(71, 1));
    groupCodes.add(GroupCode(72, 5));
    groupCodes.add(GroupCode(1, '{\\fArial|b0|i0|c163|p34;$textString}'));
    groupCodes.add(GroupCode(73, 1));
    groupCodes.add(GroupCode(44, 1.0));
    groupCodes.add(GroupCode(1001, 'ACAD'));
  }
}
