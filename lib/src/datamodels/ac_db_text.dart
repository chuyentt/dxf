import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbText implements AcDbEntity {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbText._init(this._handle);
  static Future<AcDbText> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbText._init(handle);
    _acDbEntity._groupCodes.addAll(codes);

    result =
        codes.firstWhere((element) => element.code == 10, orElse: () => null);
    if (result != null) {
      _acDbEntity._x = double.parse(result.value);
    }

    result =
        codes.firstWhere((element) => element.code == 20, orElse: () => null);
    if (result != null) {
      _acDbEntity._y = double.parse(result.value);
    }

    result =
        codes.firstWhere((element) => element.code == 30, orElse: () => null);
    if (result != null) {
      _acDbEntity._z = double.parse(result.value);
    }

    result =
        codes.firstWhere((element) => element.code == 1, orElse: () => null);
    if (result != null) {
      _acDbEntity._textString = result.value;
    }

    result =
        codes.firstWhere((element) => element.code == 40, orElse: () => null);
    if (result != null) {
      _acDbEntity._textHeight = double.parse(result.value);
    }

    result =
        codes.firstWhere((element) => element.code == 8, orElse: () => null);
    if (result != null) {
      _acDbEntity._layerName = result.value;
    }
    return _acDbEntity;
  }

  AcDbText(this._handle,
      {double x = 0,
      double y = 0,
      double z = 0,
      String textString = '',
      double textHeight = 2.5,
      String layerName = '0'})
      : _x = x,
        _y = y,
        _z = z,
        _textString = textString,
        _textHeight = textHeight,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'TEXT'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbText'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(40, textHeight));
    _groupCodes.add(GroupCode(1, textString));
    _groupCodes.add(GroupCode(100, 'AcDbText'));
  }

  double _x = 0;
  double get x => _x;
  set x(double value) {
    var result = _groupCodes.firstWhere((element) => element.code == 10,
        orElse: () => null);
    if (result != null) {
      _x = value;
      result.value = value;
    }
  }

  double _y = 0;
  double get y => _y;
  set y(double value) {
    var result = _groupCodes.firstWhere((element) => element.code == 20,
        orElse: () => null);
    if (result != null) {
      _y = value;
      result.value = value;
    }
  }

  double _z = 0;
  double get z => _z;
  set z(double value) {
    var result = _groupCodes.firstWhere((element) => element.code == 30,
        orElse: () => null);
    if (result != null) {
      _z = value;
      result.value = value;
    }
  }

  String _textString = '';
  String get textString => _textString;
  set textString(String value) {
    var result = _groupCodes.firstWhere((element) => element.code == 1,
        orElse: () => null);
    if (result != null) {
      _textString = value;
      result.value = value;
    }
  }

  double _textHeight = 2.5;
  double get textHeight => _textHeight;
  set textHeight(double value) {
    var result = _groupCodes.firstWhere((element) => element.code == 40,
        orElse: () => null);
    if (result != null) {
      _textHeight = value;
      result.value = value;
    }
  }

  String _layerName = '0';
  String get layerName => _layerName;
  set layerName(String value) {
    var result = _groupCodes.firstWhere((element) => element.code == 8,
        orElse: () => null);
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
  int get handle => _handle;
}
