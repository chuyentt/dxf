part of dxf;

/// TABLES Section
///
/// The group codes described in this chapter are found in DXF™ files and used
/// by applications. The TABLES section contains several tables, each of which
/// can contain a variable number of entries.
class TablesSection {
  /// DXF Group Codes
  final groupCodes = <GroupCode>[];

  TablesSection._init();

  /// Return the Tables section from group codes
  factory TablesSection.fromGroupCodes(List<GroupCode> codes) {
    var _section = TablesSection._init();
    _section.groupCodes.addAll(codes);
    return _section;
  }
}
