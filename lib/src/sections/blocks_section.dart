part of dxf;

/// BLOCKS Section
///
/// The BLOCKS section of the DXF file contains an entry for each block
/// reference in the drawing.
class BlocksSection {
  /// DXF Group Codes
  final groupCodes = <GroupCode>[];
  BlocksSection._init();
  factory BlocksSection.fromGroupCodes(List<GroupCode> codes) {
    var _section = BlocksSection._init();
    _section.groupCodes.addAll(codes);
    return _section;
  }
}
