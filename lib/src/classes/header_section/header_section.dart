import '../section.dart';
import '../element.dart';
import '../group_code.dart';
import 'acadver.dart';
import 'ext.dart';
import 'handseed.dart';
import 'text_size.dart';

class HeaderSection extends Section {
  final List<Element> _undefinedElements = <Element>[];
  List<Element> get undefinedElements => _undefinedElements;

  final _handSeed = HandSeed();
  int get handSeed => _handSeed.handSeed;
  void increaseHandSeed() => _handSeed.increase();

  final _acadVer = AcadVer();

  String get acadVer => _acadVer.acadVer;
  set acadVer(value) {
    _acadVer.acadVer = value;
  }

  final _textSize = TextSize();

  double get textSize => _textSize.textHeight;
  set textSize(value) {
    _textSize.textHeight = value;
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

  @override
  Future parse(List<GroupCode> groupCodes) async {
    if (groupCodes.length < 4 && groupCodes.length % 2 != 0) return null;
    var codes = <GroupCode>[];
    var variableName;
    groupCodes.forEach((groupCode) {
      if (!groupCode.isSECTION && !groupCode.isHEADER) {
        if (groupCode.key == 9 || groupCode.isENDSEC) {
          switch (variableName) {
            case '\$HANDSEED':
              _handSeed.groupCodes.addAll(codes);
              _handSeed.parse();
              variableName = null;
              break;
            case '\$ACADVER':
              _acadVer.groupCodes.addAll(codes);
              _acadVer.parse();
              variableName = null;
              break;
            // case '\$EXTMIN':
            //   _extMin.groupCodes.addAll(codes);
            //   _extMin.parse();
            //   variableName = null;
            //   break;
            // case '\$EXTMAX':
            //   _extMax.groupCodes.addAll(codes);
            //   _extMax.parse();
            //   variableName = null;
            //   break;
            // case '\$TEXTSIZE':
            //   _textSize.groupCodes.addAll(codes);
            //   _textSize.parse();
            //   variableName = null;
            //   break;
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
    var str = '';
    str += '0\r\nSECTION\r\n2\r\nHEADER\r\n';
    str += '${_handSeed.dxfString}';
    str += '${_acadVer.dxfString}';
    // str += '${_extMin.dxfString}';
    // str += '9\r\n\$EXTMAX\r\n${_extMax.dxfString}';
    // str += '9\r\n\$TEXTSIZE\r\n${_textSize.dxfString}';

    undefinedElements.forEach((m) {
      str += m.dxfString;
    });
    return str + '0\r\nENDSEC\r\n';
  }
}
