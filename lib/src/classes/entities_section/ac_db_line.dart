import '../group_code.dart';
import 'ac_db_entity.dart';

/// Autocad Database Line
class AcDbLine extends AcDbEntity {
  AcDbLine(
      {double x = 0,
      double y = 0,
      double z = 0,
      double x1 = 0,
      double y1 = 0,
      double z1 = 0}) {
    _x = x;
    _y = y;
    _z = z;
    _x1 = x1;
    _y1 = y1;
    _z1 = z1;
    groupCodes.add(GroupCode(key: 10, value: x));
    groupCodes.add(GroupCode(key: 20, value: y));
    groupCodes.add(GroupCode(key: 30, value: z));
    groupCodes.add(GroupCode(key: 11, value: x1));
    groupCodes.add(GroupCode(key: 21, value: y1));
    groupCodes.add(GroupCode(key: 31, value: z1));
  }

  double _x = 0, _y = 0, _z = 0;
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

  double _x1 = 0, _y1 = 0, _z1 = 0;
  double get x1 => _x1;
  set x1(value) {
    _x1 = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 11, orElse: () => null);
    if (result != null) result.value = value;
  }

  double get y1 => _y1;
  set y1(value) {
    _y1 = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 21, orElse: () => null);
    if (result != null) result.value = value;
  }

  double get z1 => _z1;
  set z1(value) {
    _z1 = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 31, orElse: () => null);
    if (result != null) result.value = value;
  }

  @override
  Future parse() {
    var result =
        groupCodes.firstWhere((code) => code.key == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);

    result =
        groupCodes.firstWhere((code) => code.key == 10, orElse: () => null);
    if (result != null) _x = double.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 20, orElse: () => null);
    if (result != null) _y = double.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 30, orElse: () => null);
    if (result != null) _z = double.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 11, orElse: () => null);
    if (result != null) _x1 = double.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 21, orElse: () => null);
    if (result != null) _y1 = double.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 31, orElse: () => null);
    if (result != null) _z1 = double.tryParse(result.value);

    return null;
  }

  @override
  String get dxfString {
    return '0\r\nLINE\r\n5\r\n${handle.toRadixString(16)}\r\n8\r\n0\r\n${super.dxfString}';
  }
}