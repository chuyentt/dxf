part of dxf;

/// SPLINE (DXF)
///
/// Subclass marker (AcDbSpline)
class AcDbSpline implements AcDbEntity {
  AcDbSpline._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'SPLINE';

  @override
  String get type => _type;

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

  factory AcDbSpline._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbSpline._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;
      result = codes.firstWhere((element) => element.code == 70);
      _acDbEntity._isClosed = int.parse(result.value) == 1 ? true : false;
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
      result = codes.firstWhere((element) => element.code == 71);
      _acDbEntity._degree = double.parse(result.value);
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }

    codes.forEach((element) {
      if (element.code == 10) {
        _acDbEntity._controlPoints.add([double.parse(element.value)]);
        _acDbEntity._groupCodes.remove(element);
      } else if (element.code == 20) {
        _acDbEntity._controlPoints.last.add(double.parse(element.value));
        _acDbEntity._groupCodes.remove(element);
      } else if (element.code == 40) {
        _acDbEntity._knots.add(double.parse(element.value));
        _acDbEntity._groupCodes.remove(element);
      }
    });
    return _acDbEntity;
  }

  AcDbSpline({
    required List<List<double>> controlPoints,
    bool isClosed = false,
    double degree = 3,
    required List<double> knots,
    String layerName = '0',
  })  : _controlPoints = controlPoints,
        _isClosed = isClosed,
        _degree = degree,
        _knots = knots,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbSpline'));
    _groupCodes.add(GroupCode(70, isClosed ? 1 : 8));
    _groupCodes.add(GroupCode(71, degree));
    _groupCodes.add(GroupCode(72, knots.length));
    _groupCodes.add(GroupCode(73, controlPoints.length));
    _groupCodes.add(GroupCode(43, 0.0));
    _knots.forEach((element) {
      _groupCodes.add(GroupCode(40, element));
    });
    _controlPoints.forEach((element) {
      _groupCodes.add(GroupCode(10, element[0]));
      _groupCodes.add(GroupCode(20, element[1]));
    });
  }

  bool _isClosed = false;
  bool get isClosed => _isClosed;
  set isClosed(bool value) {
    final result = _groupCodes.firstWhere((element) => element.code == 70);
    _isClosed = value;
    result.value = value ? 1 : 8;
  }

  double _degree = 3;
  double get degree => _degree;
  set degree(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 71);
    _degree = value;
    result.value = value;
  }

  List<double> _knots = <double>[];
  List<double> get knots => _knots;
  set knots(List<double> value) {
    final result = _groupCodes.firstWhere((element) => element.code == 72);
    result.value = value.length;
    _knots = value;
  }

  var _controlPoints = <List<double>>[];
  List<List<double>> get controlPoints => _controlPoints;
  set controlPoints(List<List<double>> value) {
    final result = _groupCodes.firstWhere((element) => element.code == 73);
    result.value = value.length;
    _controlPoints = value;
  }
}
