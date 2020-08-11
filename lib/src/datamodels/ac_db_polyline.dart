import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbPolyline extends AcDbEntityBase {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbPolyline._init(this._handle);
  static Future<AcDbPolyline> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbPolyline._init(handle);
    _acDbEntity._groupCodes.addAll(codes);
    return _acDbEntity;
  }

  AcDbPolyline(this._handle,
      {List<List<double>> vertices,
      bool isClosed = false,
      String layer = '0'}) {
    _groupCodes.add(GroupCode(0, 'LWPOLYLINE'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layer));
    _groupCodes.add(GroupCode(100, 'AcDbPolyline'));
    _groupCodes.add(GroupCode(90, vertices.length));
    _groupCodes.add(GroupCode(70, isClosed ? 1 : 0));
    _groupCodes.add(GroupCode(43, 0.0));
    vertices?.forEach((vertext) {
      _groupCodes.add(GroupCode(10, vertext[0]));
      _groupCodes.add(GroupCode(20, vertext[1]));
    });
  }

  @override
  String get dxfString {
    var str = '';
    _groupCodes.forEach((element) {
      str += element.dxfString + '\r\n';
    });
    return str;
  }

  @override
  int get handle => _handle;
}
