part of dxf;

/// OBJECTS Section
///
/// Group codes that apply to nongraphical objects are found in the OBJECTS
/// section of a DXF™ file and are used by AutoLISP ® and ObjectARX ®
/// applications in entity definition lists.
class ObjectsSection {
  /// DXF Group Codes
  final groupCodes = <GroupCode>[];

  ObjectsSection._init();
  factory ObjectsSection.fromGroupCodes(List<GroupCode> codes) {
    var _section = ObjectsSection._init();
    _section.groupCodes.addAll(codes);
    return _section;
  }
}
