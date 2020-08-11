import './../datamodels/group_code.dart';

class ClassesSection {
  final _groupCodes = <GroupCode>[];
  List<GroupCode> get groupCodes => _groupCodes;

  ClassesSection._init();
  static Future<ClassesSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = ClassesSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
