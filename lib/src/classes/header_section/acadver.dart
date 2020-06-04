import '../element.dart';
import '../group_code.dart';

class AcadVer extends Element {
  AcadVer() {
    groupCodes.add(GroupCode(key: 1, value: acadVer));
  }
  String _acadVer = 'AC1015';
  String get acadVer => _acadVer;
  set acadVer(value) {
    _acadVer = value;
    var result =
        groupCodes.firstWhere((code) => code.key == 1, orElse: () => null);
    if (result != null) result.value = value;
  }

  @override
  Future parse() {
    var result =
        groupCodes.firstWhere((code) => code.key == 1, orElse: () => null);
    if (result != null) _acadVer = result.value;
    return null;
  }
}
