import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbPoint extends AcDbEntityBase {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbPoint._init(this._handle);
  static Future<AcDbPoint> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbPoint._init(handle);
    _acDbEntity._groupCodes.addAll(codes);
    return _acDbEntity;
  }

  AcDbPoint(this._handle,
      {double x = 0, double y = 0, double z = 0, String layer = '0'}) {
    _groupCodes.add(GroupCode(0, 'POINT'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layer));
    _groupCodes.add(GroupCode(100, 'AcDbPoint'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
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
