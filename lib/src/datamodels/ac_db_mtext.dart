part of dxf;

/// MTEXT (DXF)
///
/// Subclass marker (AcDbMText)
class AcDbMText implements AcDbEntity {
  AcDbMText._init();

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

  String _textString = 'Title';
  String get textString => _textString;
  set textString(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 1);
    _textString = value;
    result.value = value;
  }

  double _textHeight = 2.5;
  double get textHeight => _textHeight;
  set textHeight(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 40);
    _textHeight = value;
    result.value = value;
  }

  double _columnWidth = 2.5;
  double get columnWidth => _columnWidth;
  set columnWidth(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 41);
    _columnWidth = value;
    result.value = value;
  }

  factory AcDbMText._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbMText._init();
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
    _groupCodes.add(GroupCode(0, 'MTEXT'));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbMText'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(40, textHeight));
    _groupCodes.add(GroupCode(41, columnWidth));
    _groupCodes.add(GroupCode(46, 0.0));
    _groupCodes.add(GroupCode(71, 1));
    _groupCodes.add(GroupCode(72, 5));
    _groupCodes.add(GroupCode(1, '{\\fArial|b0|i0|c163|p34;$textString}'));
    _groupCodes.add(GroupCode(73, 1));
    _groupCodes.add(GroupCode(44, 1.0));
    _groupCodes.add(GroupCode(1001, 'ACAD'));
  }
}
