import './../../dxf.dart';
import './../datamodels/group_code.dart';
import './../datamodels/ac_db_entity.dart';
import './../datamodels/ac_db_line.dart';
import './../datamodels/ac_db_mtext.dart';
import './../datamodels/ac_db_polyline.dart';
import './../datamodels/ac_db_text.dart';
import 'header_section.dart';

class EntitiesSection {
  final _entities = <AcDbEntityBase>[];
  HeaderSection headerSection;

  EntitiesSection._init();
  static Future<EntitiesSection> fromGroupCodes(
      List<GroupCode> groupCodes) async {
    var _section = EntitiesSection._init();
    var codes = <GroupCode>[];
    groupCodes.skip(2).forEach((element) async {
      if (element.isAcDbEntity) {
        var _codes = codes;
        codes = [];
        codes.add(element);
        if (_codes.isNotEmpty) {
          var _element = _codes[0];
          if (_element.isAcDbPoint) {
            var item = await AcDbPoint.fromGroupCodes(_codes);
            _section._entities.add(item);
          } else if (_element.isAcDbLine) {
            var item = await AcDbLine.fromGroupCodes(_codes);
            _section._entities.add(item);
          } else if (_element.isAcDbPolyline) {
            var item = await AcDbPolyline.fromGroupCodes(_codes);
            _section._entities.add(item);
          } else if (_element.isAcDbText) {
            var item = await AcDbText.fromGroupCodes(_codes);
            _section._entities.add(item);
          } else if (_element.isAcDbMText) {
            var item = await AcDbMText.fromGroupCodes(_codes);
            _section._entities.add(item);
          } else {
            var item = await AcDbEntity.fromGroupCodes(_codes);
            _section._entities.add(item);
          }
        }
      } else {
        codes.add(element);
      }
    });
    return _section;
  }

  void addEntity(AcDbEntityBase entity) {
    _entities.add(entity);
  }

  void removeEntity(AcDbEntityBase entity) {
    _entities.remove(entity);
  }

  AcDbEntityBase getEntityByHandle(int handle) {
    var entity = _entities.where((element) => element.handle == handle).first;
    return entity;
  }

  String get dxfString {
    var str = '  0\r\nSECTION\r\n  2\r\nENTITIES\r\n';
    _entities.forEach((element) {
      str += element.dxfString;
    });
    return str + '  0\r\nENDSEC';
  }
}
