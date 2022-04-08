part of dxf;

/// POLYLINE (DXF)
///
/// Subclass marker (AcDbPolyline)
class AcDbPolyline implements AcDbEntity {
  AcDbPolyline._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _handle = '190';

  @override
  String get handle => _handle;

  @override
  String _layerName = '0';

  @override
  String get layerName => _layerName;

  @override
  set layerName(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 8);
    _layerName = value;
    result.value = value;
  }

  factory AcDbPolyline._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbPolyline._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;
      result = codes.firstWhere((element) => element.code == 70);
      _acDbEntity._isClosed = int.parse(result.value) == 1 ? true : false;
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }

    codes.forEach((element) {
      if (element.code == 10) {
        _acDbEntity._vertices.add([double.parse(element.value)]);
        _acDbEntity._groupCodes.remove(element);
      } else if (element.code == 20) {
        _acDbEntity._vertices.last.add(double.parse(element.value));
        _acDbEntity._groupCodes.remove(element);
      }
    });
    return _acDbEntity;
  }

  AcDbPolyline({
    required List<List<double>> vertices,
    bool isClosed = false,
    String layerName = '0',
  })  : _vertices = vertices,
        _isClosed = isClosed,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, 'LWPOLYLINE'));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbPolyline'));
    _groupCodes.add(GroupCode(90, vertices.length));
    _groupCodes.add(GroupCode(70, isClosed ? 1 : 0));
    _groupCodes.add(GroupCode(43, 0.0));
  }

  var _vertices = <List<double>>[];
  List<List<double>> get vertices => _vertices;
  set vertices(List<List<double>> value) {
    final result = _groupCodes.firstWhere((element) => element.code == 90);
    result.value = value.length;
    _vertices = value;
  }

  bool _isClosed = false;
  bool get isClosed => _isClosed;
  set isClosed(bool value) {
    final result = _groupCodes.firstWhere((element) => element.code == 70);
    _isClosed = value;
    result.value = value ? 1 : 0;
  }
}
