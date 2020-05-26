import '../base_section.dart';
import '../element.dart';
import '../group_code.dart';
import 'acadver.dart';
import 'ext.dart';
import 'handseed.dart';

class HeaderSection extends BaseSection {
  final List<Element> _undefinedElements = <Element>[];
  List<Element> get undefinedElements => _undefinedElements;

  final _handSeed = HandSeed();
  String get handSeed => _handSeed.handSeed;
  void increaseHandSeed() => _handSeed.increase();

  final _acadVer = AcadVer();

  String get acadVer => _acadVer.acadVer;
  set acadVer(value) {
    _acadVer.acadVer = value;
  }

  final Ext _extMin = Ext();
  double get extMinX => _extMin.x;
  set extMinX(value) => _extMin.x = value;
  double get extMinY => _extMin.y;
  set extMinY(value) => _extMin.y = value;
  double get extMinZ => _extMin.z;
  set extMinZ(value) => _extMin.z = value;
  
  final Ext _extMax = Ext();
  double get extMaxX => _extMax.x;
  set extMaxX(value) => _extMax.x = value;
  double get extMaxY => _extMax.y;
  set extMaxY(value) => _extMax.y = value;
  double get extMaxZ => _extMax.z;
  set extMaxZ(value) => _extMax.z = value;
  
  bool _isNotEmpty = false;
  @override
  bool get isNotEmpty => _isNotEmpty;
  
  @override
  Future parse(List<GroupCode> groupCodes) async {
    if (groupCodes.length < 4 && groupCodes.length % 2 != 0) return null;
    var codes = <GroupCode>[];
    var variableName;
    _isNotEmpty = true;
    groupCodes.forEach((groupCode) {
      if (!groupCode.isSECTION && !groupCode.isHEADER) {
        if (groupCode.key == 9 || groupCode.isENDSEC) {
          switch (variableName) {
            case '\$ACADVER':
              _acadVer.groupCodes.addAll(codes);
              _acadVer.parse();
              break;
            case '\$EXTMIN':
              _extMin.groupCodes.addAll(codes);
              _extMin.parse();
              break;
            case '\$EXTMAX':
              _extMax.groupCodes.addAll(codes);
              _extMax.parse();
              break;
            case '\$HANDSEED':
              _handSeed.groupCodes.addAll(codes);
              _handSeed.parse();
              break;
            default:
              if (variableName != null) {
                var variable = UndefinedElement();
                variable.groupCodes.addAll(codes);
                _undefinedElements.add(variable);
              }
          }
          variableName = groupCode.value;
          codes = <GroupCode>[];
        }
        codes.add(groupCode);
      }
    });
  }

  @override
  String get dxfString {
    var str = '0\r\nSECTION\r\n2\r\nHEADER\r\n';
    if (_acadVer.groupCodes.isNotEmpty) {
      str += _acadVer.dxfString;
    }
    if (_extMin.groupCodes.isNotEmpty) {
      str += _extMin.dxfString;
    }
    if (_extMax.groupCodes.isNotEmpty) {
      str += _extMax.dxfString;
    }
    if (_handSeed.groupCodes.isNotEmpty) {
      str += _handSeed.dxfString;
    }

    undefinedElements.forEach((m) {
      str += m.dxfString;
    });
    return str + '0\r\nENDSEC\r\n';
  }
}