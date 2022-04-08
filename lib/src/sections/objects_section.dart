part of dxf;

/// OBJECTS Section
///
/// Group codes that apply to nongraphical objects are found in the OBJECTS
/// section of a DXF™ file and are used by AutoLISP ® and ObjectARX ®
/// applications in entity definition lists.
class ObjectsSection {
  ObjectsSection._init();

  /// DXF Group Codes
  final _groupCodes = <GroupCode>[];

  factory ObjectsSection._fromGroupCodes(List<GroupCode> codes) {
    var _section = ObjectsSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
