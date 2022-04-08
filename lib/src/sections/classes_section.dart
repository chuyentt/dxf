part of dxf;

/// CLASSES Section
///
/// The CLASSES section in DXF files holds the information for
/// application-defined classes whose instances appear in the BLOCKS,
/// ENTITIES, and OBJECTS sections of the database. It is assumed that a class
/// definition is permanently fixed in the class hierarchy. All fields are
/// required.
class ClassesSection {
  ClassesSection._init();

  /// DXF Group Codes
  final _groupCodes = <GroupCode>[];

  factory ClassesSection._fromGroupCodes(List<GroupCode> codes) {
    var _section = ClassesSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
