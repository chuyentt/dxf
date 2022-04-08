part of dxf;

/// HEADER Section
///
/// The HEADER section of a DXF file contains the settings of variables
/// associated with the drawing. Each variable is specified by a 9 group
/// code giving the variable's name, followed by groups that supply the
/// variable's value. Only the variables that are saved in the drawing
/// file are listed.
class HeaderSection {
  HeaderSection._init();

  /// DXF Group Codes
  final _groupCodes = <GroupCode>[];

  int _nextHandle = 400;

  void _increase() {
    _nextHandle++;
    var result = _groupCodes.firstWhere((element) => element.code == 5);
    result.value = _nextHandle.toRadixString(16);
  }

  factory HeaderSection._fromGroupCodes(List<GroupCode> codes) {
    var _section = HeaderSection._init();
    _section._groupCodes.addAll(codes);
    _section._parse();
    return _section;
  }

  void _parse() {
    try {
      final result = _groupCodes.firstWhere((element) => element.code == 5);
      _nextHandle = int.tryParse(result.value, radix: 16)!;
    } catch (e) {
      _nextHandle = 400;
    }
  }
}
