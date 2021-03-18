part of dxf;

class AcDbMText implements AcDbEntity {
  @override
  final List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  final int? _handle;
  AcDbMText._init(this._handle);
  static Future<AcDbMText> fromGroupCodes(List<GroupCode> codes) async {
    int? handle;
    var result = codes.firstWhereOrNull((element) => element.code == 5);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbMText._init(handle);
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

    result = codes.firstWhereOrNull((element) => element.code == 1);
    if (result != null) {
      _acDbEntity._textString = result.value;
    }

    result = codes.firstWhereOrNull((element) => element.code == 40);
    if (result != null) {
      _acDbEntity._textHeight = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 41);
    if (result != null) {
      _acDbEntity._columnWidth = double.parse(result.value);
    }

    result = codes.firstWhereOrNull((element) => element.code == 8);
    if (result != null) {
      _acDbEntity._layerName = result.value;
    }

    return _acDbEntity;
  }

  AcDbMText(this._handle,
      {double x = 0,
      double y = 0,
      double z = 0,
      String textString = '',
      double textHeight = 2.5,
      double columnWidth = 20.0,
      String layerName = '0'})
      : _x = x,
        _y = y,
        _z = z,
        _textString = textString,
        _textHeight = textHeight,
        _columnWidth = columnWidth,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'MTEXT'));
    _groupCodes.add(GroupCode(5, handle!.toRadixString(16)));
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

  String _textString = '';
  String get textString => _textString;
  set textString(String value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 1);
    if (result != null) {
      _textString = value;
      result.value = value;
    }
  }

  double _textHeight = 2.5;
  double get textHeight => _textHeight;
  set textHeight(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 40);
    if (result != null) {
      _textHeight = value;
      result.value = value;
    }
  }

  double _columnWidth = 2.5;
  double get columnWidth => _columnWidth;
  set columnWidth(double value) {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 41);
    if (result != null) {
      _columnWidth = value;
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
