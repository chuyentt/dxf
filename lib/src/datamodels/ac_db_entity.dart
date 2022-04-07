part of dxf;

/// Create AcDbEntity.
class AcDbEntity {
  AcDbEntity._();

  List<GroupCode> groupCodes = <GroupCode>[];

  String get dxfString {
    return groupCodes.expand((e) => [e.dxfString]).join();
  }

  String _handle = '';
  String get handle => _handle;
  set handle(value) {
    final result = groupCodes.firstWhere((element) => element.code == 5);
    _handle = value;
    result.value = value;
  }

  String _layerName = '0';
  String get layerName => _layerName;
  set layerName(String value) {
    final result = groupCodes.firstWhere((element) => element.code == 8);
    _layerName = value;
    result.value = value;
  }

  factory AcDbEntity.fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbEntity._();
    _acDbEntity.groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity.handle = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }
}
