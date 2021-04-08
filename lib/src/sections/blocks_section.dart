part of dxf;

/// BLOCKS Section
///
/// The BLOCKS section of the DXF file contains an entry for each block
/// reference in the drawing.
class BlocksSection {
  final _groupCodes = <GroupCode>[];

  /// DXF Group Codes
  List<GroupCode> get groupCodes => _groupCodes;

  BlocksSection._init();
  static Future<BlocksSection> fromGroupCodes(List<GroupCode> codes) async {
    var _section = BlocksSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }
}
