import 'group_code.dart';

abstract class AcDbEntityBase {
  final List<GroupCode> _groupCodes = <GroupCode>[];

  int get handle;

  String get dxfString;
}

class AcDbEntity extends AcDbEntityBase {
  final int _handle;
  AcDbEntity._init(this._handle);
  static Future<AcDbEntity> fromGroupCodes(List<GroupCode> codes) async {
    int handle;
    var result =
        codes.firstWhere((element) => element.code == 5, orElse: () => null);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbEntity._init(handle);
    _acDbEntity._groupCodes.addAll(codes);
    return _acDbEntity;
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
