import '../base_section.dart';
import '../element.dart';
import '../group_code.dart';

class EntitiesSection extends BaseSection {
  final List<Element> _undefinedElements = <Element>[];
  List<Element> get undefinedElements => _undefinedElements;

  bool _isNotEmpty = false;
  @override
  bool get isNotEmpty => _isNotEmpty;

  @override
  Future parse(List<GroupCode> groupCodes) async {
    if (groupCodes.length < 4 && groupCodes.length % 2 != 0) return null;
    var codes = <GroupCode>[];
    _isNotEmpty = true;
    groupCodes.forEach((groupCode) {
      if (!groupCode.isSECTION && !groupCode.isENTITIES) {
        if (groupCode.isENDSEC) {
          var variable = UndefinedElement();
          variable.groupCodes.addAll(codes);
          _undefinedElements.add(variable);
          codes = <GroupCode>[];
        }
        codes.add(groupCode);
      }
    });
  }

  @override
  String get dxfString {
    var str = '0\r\nSECTION\r\n2\r\nENTITIES\r\n';
    undefinedElements.forEach((m) {
      str += m.dxfString;
    });
    return str + '0\r\nENDSEC\r\n';
  }
}