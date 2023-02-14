part of dxf;

enum EntityType {
  EMPTY,
  POINT,
  ARC,
  LINE,
  MTEXT,
  POLYLINE,
  SOLID,
  TEXT,
}

/// Create AcDbEntity.
class AcDbEntity {
  AcDbEntity._init();

  /// Group Codes in DXF Files
  List<GroupCode> _groupCodes = <GroupCode>[];

  /// Generate DXF ASCII string to write to DXF file
  String get _dxfString {
    return _groupCodes.expand((e) => [e._dxfString]).join();
  }

  String _type = '';

  /// Type of entity
  ///
  /// ARC | CIRCLE | ELLIPSE | LINE | MTEXT | POINT | POLYLINE | SOLID | TEXT
  String get type => _type;

  String _handle = '';

  /// DXF handle
  ///
  /// A handle is a hexadecimal number that is a unique tag for each entity
  /// in a drawing or DXF file
  String get handle => _handle;

  String _layerName = '0';

  /// DXF layer
  String get layerName => _layerName;
  set layerName(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 8);
    _layerName = value;
    result.value = value;
  }

  factory AcDbEntity._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbEntity._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }
}
