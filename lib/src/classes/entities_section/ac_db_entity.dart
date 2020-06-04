import '../group_code.dart';

abstract class AcDbEntity {
  int handle = 0;

  final _groupCodes = <GroupCode>[];
  List<GroupCode> get groupCodes => _groupCodes;

  Future parse();

  String get dxfString {
    var str = '';
    groupCodes.forEach((groupCode) {
      str += groupCode.dxfString;
    });
    return str;
  }
}
