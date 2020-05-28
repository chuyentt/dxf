import '../element.dart';
import '../group_code.dart';

/// Autocad Database Text
class AcDbText extends Element {
  int _handle;
  int get handle => _handle;

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

  @override
  Future parse() {
    var result =
        groupCodes.firstWhere((code) => code.key == 5, orElse: () => null);
    if (result != null) _handle = int.tryParse(result.value, radix: 16);

    result =
        groupCodes.firstWhere((code) => code.key == 10, orElse: () => null);
    if (result != null) _x = double.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 20, orElse: () => null);
    if (result != null) _y = double.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 30, orElse: () => null);
    if (result != null) _z = double.tryParse(result.value);

    result = groupCodes.firstWhere((code) => code.key == 1, orElse: () => null);
    if (result != null) _value = result.value;

    return null;
  }
}