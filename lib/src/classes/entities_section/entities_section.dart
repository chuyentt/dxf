import 'dart:collection';

import '../header_section/handseed.dart';
import '../section.dart';
import '../element.dart';
import '../group_code.dart';
import 'ac_db_line.dart';
import 'ac_db_point.dart';
import 'ac_db_polyline.dart';
import 'ac_db_text.dart';

class EntityList<E> extends ListBase<E> {
  List innerList = [];

  @override
  int get length => innerList.length;

  @override
  set length(int length) {
    innerList.length = length;
  }

  @override
  void operator[]=(int index, E value) {
    innerList[index] = value;
  }

  @override
  E operator [](int index) => innerList[index];

  @override
  void add(E value) {
    var handSeed = HandSeed();
    if (value is AcDbPoint) {
      value.handle = handSeed.handSeed; 
    } else if (value is AcDbLine) {
      value.handle = handSeed.handSeed; 
    } else if (value is AcDbPolyline) {
      value.handle = handSeed.handSeed; 
    } else if (value is AcDbText) {
      value.handle = handSeed.handSeed; 
    }
    innerList.add(value);
    handSeed.increase();
  }

  @override
  void addAll(Iterable<E> all) {
    innerList.addAll(all);
  }
}

class EntitiesSection extends Section {
  final List<Element> _undefinedElements = <Element>[];
  List<Element> get undefinedElements => _undefinedElements;

  final _points = EntityList<AcDbPoint>();
  EntityList<AcDbPoint> get points => _points;

  final List<AcDbLine> _lines = EntityList<AcDbLine>();
  EntityList<AcDbLine> get lines => _lines;

  final _texts = EntityList<AcDbText>();
  EntityList<AcDbText> get texts => _texts;

  final _polylines = EntityList<AcDbPolyline>();
  EntityList<AcDbPolyline> get polylines => _polylines;

  @override
  Future parse(List<GroupCode> groupCodes) async {
    if (groupCodes.length < 4 && groupCodes.length % 2 != 0) return null;
    var codes = <GroupCode>[];
    var lastEntType;
    groupCodes.forEach((groupCode) {
      if (!groupCode.isSECTION && !groupCode.isENTITIES) {
        if (groupCode.isENDSEC || groupCode.key == 0) {
          // Nếu lastEntType != null
          if (lastEntType != null) {
            // Xử lý Ent trước đó
            switch (lastEntType) {
              case 'POINT':
                var acDbPoint = AcDbPoint();
                acDbPoint.groupCodes.addAll(codes);
                acDbPoint.parse();
                _points.add(acDbPoint);
                break;
              case 'LINE':
                var acDbLine = AcDbLine();
                acDbLine.groupCodes.addAll(codes);
                acDbLine.parse();
                _lines.add(acDbLine);
                break;
              case 'TEXT':
                var acDbText = AcDbText();
                acDbText.groupCodes.addAll(codes);
                acDbText.parse();
                _texts.add(acDbText);
                break;
              case 'LWPOLYLINE':
                var acDbPolyline = AcDbPolyline();
                acDbPolyline.groupCodes.addAll(codes);
                acDbPolyline.parse();
                _polylines.add(acDbPolyline);
                break;
              default:
                var variable = UndefinedElement();
                variable.groupCodes.addAll(codes);
                _undefinedElements.add(variable);
            }
            lastEntType = groupCode.value;
            codes = <GroupCode>[];
          } else {
            lastEntType = groupCode.value;
            codes = <GroupCode>[];
          }
        }
        codes.add(groupCode);
      }
    });
  }

  @override
  String get dxfString {
    var str = '0\r\nSECTION\r\n2\r\nENTITIES\r\n';
    if (points.isNotEmpty) {
      for (var item in points) {
        str += item.dxfString;
      }
    }
    if (lines.isNotEmpty) {
      for (var item in lines) {
        str += item.dxfString;
      }
    }
    if (texts.isNotEmpty) {
      for (var item in texts) {
        str += item.dxfString;
      }
    }
    if (polylines.isNotEmpty) {
      for (var item in polylines) {
        str += item.dxfString;
      }
    }
    undefinedElements.forEach((m) {
      str += m.dxfString;
    });
    return str + '0\r\nENDSEC\r\n';
  }
}