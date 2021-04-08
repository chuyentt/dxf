part of dxf;

/// OBJECTS Section
///
/// Group codes that apply to nongraphical objects are found in the OBJECTS
/// section of a DXF™ file and are used by AutoLISP ® and ObjectARX ®
/// applications in entity definition lists.
class ObjectsSection {
  final _groupCodes = <GroupCode>[];

  /// DXF Group Codes
  List<GroupCode> get groupCodes => _groupCodes;

  ObjectsSection._init();
  static Future<ObjectsSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = ObjectsSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
