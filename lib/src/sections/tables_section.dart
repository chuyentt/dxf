part of dxf;

class TablesSection {
  final _groupCodes = <GroupCode>[];
  List<GroupCode> get groupCodes => _groupCodes;

  TablesSection._init();
  static Future<TablesSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = TablesSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
