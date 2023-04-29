part of dxf;

/// ENTITIES Section
///
/// Entities group codes that apply to graphical objects.
class EntitiesSection {
  EntitiesSection._init();

  /// DXF Entities
  final entities = <AcDbEntity>[];

  factory EntitiesSection._fromGroupCodes(List<GroupCode> groupCodes) {
    var _section = EntitiesSection._init();
    var codes = <GroupCode>[];
    groupCodes.skip(2).forEach((element) async {
      if (element.isAcDbEntity) {
        var _codes = codes;
        codes = [];
        codes.add(element);
        if (_codes.isNotEmpty) {
          var _element = _codes[0];
          var item = null;
          if (_element.isAcDbArc) {
            item = AcDbArc._fromGroupCodes(_codes);
          } else if (_element.isAcDbCircle) {
            item = AcDbCircle._fromGroupCodes(_codes);
          } else if (_element.isAcDbEllipse) {
            item = AcDbEllipse._fromGroupCodes(_codes);
          } else if (_element.isAcDbLine) {
            item = AcDbLine._fromGroupCodes(_codes);
          } else if (_element.isAcDbMText) {
            item = AcDbMText._fromGroupCodes(_codes);
          } else if (_element.isAcDbPoint) {
            item = AcDbPoint._fromGroupCodes(_codes);
          } else if (_element.isAcDbPolyline) {
            item = AcDbPolyline._fromGroupCodes(_codes);
          } else if (_element.isAcDbSolid) {
            item = AcDbSolid._fromGroupCodes(_codes);
          } else if (_element.isAcDbText) {
            item = AcDbText._fromGroupCodes(_codes);
          } else if (_element.isAcDbSpline) {
            item = AcDbSpline._fromGroupCodes(_codes);
          } else {
            item = AcDbEntity._fromGroupCodes(_codes);
          }
          _section.entities.add(item);
        }
      } else {
        codes.add(element);
      }
    });
    return _section;
  }

  void _addEntity(AcDbEntity entity) {
    entities.add(entity);
  }

  bool _removeEntity(AcDbEntity entity) {
    return entities.remove(entity);
  }

  AcDbEntity? _getEntityByHandle(String handle) {
    try {
      var entity = entities.where((element) => element.handle == handle).first;
      return entity;
    } catch (e) {
      return null;
    }
  }

  String get _dxfString {
    var str = '  0\r\nSECTION\r\n  2\r\nENTITIES\r\n';
    entities.forEach((element) {
      str += element._dxfString;
    });
    return str + '  0\r\nENDSEC\r\n';
  }
}
