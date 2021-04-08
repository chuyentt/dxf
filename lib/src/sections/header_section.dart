part of dxf;

/// HEADER Section
///
/// The HEADER section of a DXF file contains the settings of variables
/// associated with the drawing. Each variable is specified by a 9 group
/// code giving the variable's name, followed by groups that supply the
/// variable's value. Only the variables that are saved in the drawing
/// file are listed.
class HeaderSection {
  final _groupCodes = <GroupCode>[];

  /// DXF Group Codes
  List<GroupCode> get groupCodes => _groupCodes;

  int _nextHandle = 400;

  /// Next available handle
  int? get nextHandle {
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 5);
    if (result != null) _nextHandle = int.tryParse(result.value, radix: 16)!;
    return _nextHandle;
  }

  void increase() {
    _nextHandle++;
    var result = _groupCodes.firstWhereOrNull((element) => element.code == 5);
    if (result != null) result.value = _nextHandle.toRadixString(16);
  }

  HeaderSection._init();
  static Future<HeaderSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = HeaderSection._init();
    _section._groupCodes.addAll(codes);
    _section._parse();
    return _section;
  }

  void _parse() {
    _groupCodes.forEach((element) {
      if (element.code == 5) {
        _nextHandle = int.tryParse(element.value, radix: 16)!;
      }
    });
  }
}
