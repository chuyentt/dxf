part of dxf;

/// CLASSES Section
///
/// The CLASSES section in DXF files holds the information for
/// application-defined classes whose instances appear in the BLOCKS,
/// ENTITIES, and OBJECTS sections of the database. It is assumed that a class
/// definition is permanently fixed in the class hierarchy. All fields are
/// required.
class ClassesSection {
  /// DXF Group Codes
  final groupCodes = <GroupCode>[];

  ClassesSection._init();
  factory ClassesSection.fromGroupCodes(List<GroupCode> codes) {
    var _section = ClassesSection._init();
    _section.groupCodes.addAll(codes);
    return _section;
  }
}
