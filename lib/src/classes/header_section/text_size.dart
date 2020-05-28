import '../element.dart';
import '../group_code.dart';

class TextSize extends Element {
  TextSize() {
    groupCodes.add(GroupCode(key: 40, value: 0.2));
  }
  double _textHeight = 0.2;
  double get textHeight => _textHeight;
  set textHeight(value) {
    _textHeight = value;
    var result = groupCodes.firstWhere((code) => code.key == 40, orElse: () => null);
    if (result != null) result.value = value;
  }

  @override
  Future parse() {
    var result = groupCodes.firstWhere((code) => code.key == 40, orElse: () => null);
    if (result != null) _textHeight = result.value;
    return null;
  }

}