part of dxf;

/// TABLES Section
///
/// The group codes described in this chapter are found in DXF™ files and used
/// by applications. The TABLES section contains several tables, each of which
/// can contain a variable number of entries.
class TablesSection {
  final _groupCodes = <GroupCode>[];

  /// DXF Group Codes
  List<GroupCode> get groupCodes => _groupCodes;

  TablesSection._init();

  /// Return the Tables section from group codes
  static Future<TablesSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = TablesSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
