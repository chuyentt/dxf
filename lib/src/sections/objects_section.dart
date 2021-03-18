part of dxf;

class ObjectsSection {
  final _groupCodes = <GroupCode>[];
  List<GroupCode> get groupCodes => _groupCodes;

  ObjectsSection._init();
  static Future<ObjectsSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = ObjectsSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
