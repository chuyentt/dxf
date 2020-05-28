import '../element.dart';
import '../group_code.dart';

/// Autocad Database Polyline
class AcDbPolyline extends Element {
  int _handle;
  int get handle => _handle;

  int _nVertices;
  int get nVertices => _nVertices;

  bool _isClosed;
  bool get isClosed => _isClosed;

  @override
  Future parse() {
    var result =
        groupCodes.firstWhere((code) => code.key == 5, orElse: () => null);
    if (result != null) _handle = int.tryParse(result.value, radix: 16);

    result =
        groupCodes.firstWhere((code) => code.key == 90, orElse: () => null);
    if (result != null) _nVertices = int.tryParse(result.value);

    result =
        groupCodes.firstWhere((code) => code.key == 70, orElse: () => null);
    if (result != null) {
      _isClosed = int.tryParse(result.value) == 1 ? true : false;
    }

    return null;
  }
}