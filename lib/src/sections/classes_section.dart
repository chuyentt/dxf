part of dxf;

/// CLASSES Section
///
/// The CLASSES section in DXF files holds the information for
/// application-defined classes whose instances appear in the BLOCKS,
/// ENTITIES, and OBJECTS sections of the database. It is assumed that a class
/// definition is permanently fixed in the class hierarchy. All fields are
/// required.
class ClassesSection {
  final _groupCodes = <GroupCode>[];

  /// DXF Group Codes
  List<GroupCode> get groupCodes => _groupCodes;

  ClassesSection._init();
  static Future<ClassesSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = ClassesSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
