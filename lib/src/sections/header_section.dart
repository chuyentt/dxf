import './../datamodels/group_code.dart';

class HeaderSection {
  final _groupCodes = <GroupCode>[];
  List<GroupCode> get groupCodes => _groupCodes;

  int _nextHandle = 400;

  /// Next available handle
  int get nextHandle {
    var result = _groupCodes.firstWhere((element) => element.code == 5,
        orElse: () => null);
    if (result != null) _nextHandle = int.tryParse(result.value, radix: 16);
    return _nextHandle;
  }

  void increase() {
    _nextHandle++;
    var result = _groupCodes.firstWhere((element) => element.code == 5,
        orElse: () => null);
    if (result != null) result.value = _nextHandle.toRadixString(16);
  }

  HeaderSection._init();
  static Future<HeaderSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = HeaderSection._init();
    _section._groupCodes.addAll(codes);
    await _section._parse();
    return _section;
  }

  void _parse() {
    _groupCodes.forEach((element) {
      if (element.code == 5) {
        _nextHandle = int.tryParse(element.value, radix: 16);
      }
    });
  }
}
