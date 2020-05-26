import 'group_code.dart';

/// A group code's value indicates what type of data element follows.
/// This value also indicates the meaning of a data element for a given object (or record) type.
/// Virtually all user-specified information in a drawing file can be represented in DXF format.
abstract class Element {
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

/// For all element we do not used
class UndefinedElement extends Element {
  @override
  Future parse() {
    return null;
  }
}