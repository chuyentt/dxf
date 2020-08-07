import '../group_code.dart';
import 'ac_db_entity.dart';

/// Autocad Database Text
class AcDbText extends AcDbEntity {
  AcDbText(
      {double x = 0,
      double y = 0,
      double z = 0,
      String value = '',
      double textHeight = 0.2}) {
    _x = x;
    _y = y;
    _z = z;
    groupCodes.add(GroupCode(key: 10, value: x));
    groupCodes.add(GroupCode(key: 20, value: y));
    groupCodes.add(GroupCode(key: 30, value: z));
    groupCodes.add(GroupCode(key: 1, value: value));
    groupCodes.add(GroupCode(key: 40, value: textHeight));
  }
  double _x, _y, _z;
  double get x => _x;
  set x(value) {
    _x = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 10, orElse: () => null);
    if (result != null) result.value = value;
  }

  double get y => _y;
  set y(value) {
    _y = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 20, orElse: () => null);
    if (result != null) result.value = value;
  }

  double get z => _z;
  set z(value) {
    _z = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 30, orElse: () => null);
    if (result != null) result.value = value;
  }

  String _value;
  String get value => _value;
  set value(value) {
    _value = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 1, orElse: () => null);
    if (result != null) result.value = value;
  }

  double _textHeight = 0.2;
  double get textHeight => _textHeight;
  set textHeight(value) {
    _textHeight = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 40, orElse: () => null);
    if (result != null) result.value = value;
  }

  @override
  Future parse() {
    var result =
        groupCodes.firstWhere((code) => code.key == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);

    result =
        groupCodes.firstWhere((code) => code.key == 10, orElse: () => null);
    if (result != null) _x = result.value;

    result =
        groupCodes.firstWhere((code) => code.key == 20, orElse: () => null);
    if (result != null) _y = result.value;

    result =
        groupCodes.firstWhere((code) => code.key == 30, orElse: () => null);
    if (result != null) _z = result.value;

    result = groupCodes.firstWhere((code) => code.key == 1, orElse: () => null);
    if (result != null) _value = result.value;

    result =
        groupCodes.firstWhere((code) => code.key == 40, orElse: () => null);
    if (result != null) _textHeight = result.value;

    return null;
  }

  @override
  String get dxfString {
    return '0\r\nTEXT\r\n5\r\n${handle.toRadixString(16)}\r\n8\r\n0\r\n${super.dxfString}';
  }
}
