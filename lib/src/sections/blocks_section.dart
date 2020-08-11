import './../datamodels/group_code.dart';

class BlocksSection {
  final _groupCodes = <GroupCode>[];
  List<GroupCode> get groupCodes => _groupCodes;

  BlocksSection._init();
  static Future<BlocksSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = BlocksSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
