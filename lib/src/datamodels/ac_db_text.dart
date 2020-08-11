import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbText extends AcDbEntityBase {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbText._init(this._handle);
  static Future<AcDbText> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbText._init(handle);
    _acDbEntity._groupCodes.addAll(codes);
    return _acDbEntity;
  }

  AcDbText(this._handle,
      {double x = 0,
      double y = 0,
      double z = 0,
      String value = '',
      double textHeight = 2.5,
      String layer = '0'}) {
    _groupCodes.add(GroupCode(0, 'TEXT'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layer));
    _groupCodes.add(GroupCode(100, 'AcDbText'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(40, textHeight));
    _groupCodes.add(GroupCode(1, value));
    _groupCodes.add(GroupCode(100, 'AcDbText'));
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
