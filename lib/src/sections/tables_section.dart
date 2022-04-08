part of dxf;

/// TABLES Section
///
/// The group codes described in this chapter are found in DXF™ files and used
/// by applications. The TABLES section contains several tables, each of which
/// can contain a variable number of entries.
class TablesSection {
  TablesSection._init();

  /// DXF Group Codes
  final _groupCodes = <GroupCode>[];

  /// Return the Tables section from group codes
  factory TablesSection._fromGroupCodes(List<GroupCode> codes) {
    var _section = TablesSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
