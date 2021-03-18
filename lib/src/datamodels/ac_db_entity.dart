part of dxf;

class AcDbEntity extends AcDbEntityBase {
  final List<GroupCode> _groupCodes = <GroupCode>[];
  final int? _handle;
  AcDbEntity._init(this._handle);
  static Future<AcDbEntity> fromGroupCodes(List<GroupCode> codes) async {
    int? handle;
    var result = codes.firstWhereOrNull((element) => element.code == 5);
    if (result != null) handle = int.tryParse(result.value, radix: 16);
    var _acDbEntity = AcDbEntity._init(handle);
    _acDbEntity._groupCodes.addAll(codes);
    return _acDbEntity;
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
  int? get handle => _handle;
}
