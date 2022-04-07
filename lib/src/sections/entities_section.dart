part of dxf;

/// ENTITIES Section
///
/// Entities group codes that apply to graphical objects.
class EntitiesSection {
  final entities = <AcDbEntity>[];

  EntitiesSection._init();
  factory EntitiesSection.fromGroupCodes(List<GroupCode> groupCodes) {
    var _section = EntitiesSection._init();
    var codes = <GroupCode>[];
    groupCodes.skip(2).forEach((element) async {
      if (element.isAcDbEntity) {
        var _codes = codes;
        codes = [];
        codes.add(element);
        if (_codes.isNotEmpty) {
          var _element = _codes[0];
          var item;
          if (_element.isAcDbArc) {
            item = AcDbArc.fromGroupCodes(_codes);
          } else if (_element.isAcDbCircle) {
            item = AcDbCircle.fromGroupCodes(_codes);
          } else if (_element.isAcDbEllipse) {
            item = AcDbEllipse.fromGroupCodes(_codes);
          } else if (_element.isAcDbLine) {
            item = AcDbLine.fromGroupCodes(_codes);
          } else if (_element.isAcDbMText) {
            item = AcDbMText.fromGroupCodes(_codes);
          } else if (_element.isAcDbPoint) {
            item = AcDbPoint.fromGroupCodes(_codes);
          } else if (_element.isAcDbPolyline) {
            item = AcDbPolyline.fromGroupCodes(_codes);
          } else if (_element.isAcDbText) {
            item = AcDbText.fromGroupCodes(_codes);
          } else {
            item = AcDbEntity.fromGroupCodes(codes);
          }
          _section.entities.add(item);
        }
      } else {
        codes.add(element);
      }
    });
    return _section;
  }

  void addEntity(AcDbEntity entity) {
    entities.add(entity);
  }

  void removeEntity(AcDbEntity entity) {
    entities.remove(entity);
  }

  AcDbEntity getEntityByHandle(String handle) {
    var entity = entities.where((element) => element.handle == handle).first;
    return entity;
  }

  String get dxfString {
    var str = '  0\r\nSECTION\r\n  2\r\nENTITIES\r\n';
    entities.forEach((element) {
      str += element.dxfString;
    });
    return str + '  0\r\nENDSEC\r\n';
  }
}
