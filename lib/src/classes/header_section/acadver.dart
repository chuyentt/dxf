import '../element.dart';

class AcadVer extends Element {
  String _acadVer = 'AC1021';
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
