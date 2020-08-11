import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbLine implements AcDbEntity {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbLine._init(this._handle);
  static Future<AcDbLine> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbLine._init(handle);
    _acDbEntity._groupCodes.addAll(codes);
    return _acDbEntity;
  }

  AcDbLine(this._handle,
      {double x = 0,
      double y = 0,
      double z = 0,
      double x1 = 0,
      double y1 = 0,
      double z1 = 0,
      String layer = '0'}) {
    _groupCodes.add(GroupCode(0, 'LINE'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layer));
    _groupCodes.add(GroupCode(100, 'AcDbLine'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(11, x1));
    _groupCodes.add(GroupCode(21, y1));
    _groupCodes.add(GroupCode(31, z1));
  }

  @override
  String get dxfString {
    var str = '';
    _groupCodes.forEach((element) {
      str += element.dxfString;
    });
    return str;
  }

  @override
  int get handle => _handle;
}
