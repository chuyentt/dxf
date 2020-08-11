import 'group_code.dart';
import 'ac_db_entity.dart';

class AcDbMText extends AcDbEntityBase {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int _handle;
  AcDbMText._init(this._handle);
  static Future<AcDbMText> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbMText._init(handle);
    _acDbEntity._groupCodes.addAll(codes);
    return _acDbEntity;
  }

  AcDbMText(this._handle,
      {double x = 0,
      double y = 0,
      double z = 0,
      String value = '',
      double textHeight = 2.5,
      double columnWidth = 20.0,
      String layer = '0'}) {
    _groupCodes.add(GroupCode(0, 'MTEXT'));
    _groupCodes.add(GroupCode(5, handle.toRadixString(16)));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layer));
    _groupCodes.add(GroupCode(100, 'AcDbMText'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(40, textHeight));
    _groupCodes.add(GroupCode(41, 3.303));
    _groupCodes.add(GroupCode(46, 0.0));
    _groupCodes.add(GroupCode(71, 1));
    _groupCodes.add(GroupCode(72, 5));
    _groupCodes.add(GroupCode(1, '{\\fArial|b0|i0|c163|p34;$value}'));
    _groupCodes.add(GroupCode(73, 1));
    _groupCodes.add(GroupCode(44, 1.0));
    _groupCodes.add(GroupCode(1001, 'ACAD'));
    _groupCodes.add(GroupCode(1000, 'ACAD_MTEXT_COLUMN_INFO_BEGIN'));
    _groupCodes.add(GroupCode(1070, 75));
    _groupCodes.add(GroupCode(1070, 2));
    _groupCodes.add(GroupCode(1070, 79));
    _groupCodes.add(GroupCode(1070, 0));
    _groupCodes.add(GroupCode(1070, 76));
    _groupCodes.add(GroupCode(1070, 1));
    _groupCodes.add(GroupCode(1070, 78));
    _groupCodes.add(GroupCode(1070, 0));
    _groupCodes.add(GroupCode(1070, 48));
    _groupCodes.add(GroupCode(1040, columnWidth));
    _groupCodes.add(GroupCode(1070, 49));
    _groupCodes.add(GroupCode(1040, 1.0));
    _groupCodes.add(GroupCode(1070, 50));
    _groupCodes.add(GroupCode(1070, 1));
    _groupCodes.add(GroupCode(1040, 0.0));
    _groupCodes.add(GroupCode(1000, 'ACAD_MTEXT_COLUMN_INFO_END'));
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
