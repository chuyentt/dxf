import 'dart:convert';
import 'package:universal_io/io.dart';

import 'sections/classes_section.dart';
import 'sections/blocks_section.dart';
import 'sections/entities_section.dart';
import 'sections/header_section.dart';
import 'sections/objects_section.dart';
import 'sections/tables_section.dart';
import 'datamodels/group_code.dart';
import 'datamodels/ac_db_entity.dart';

class DXF {
  final _groupCodes = <GroupCode>[];

  String _filePath;

  HeaderSection _headerSection;
  ClassesSection _classesSection;
  TablesSection _tablesSection;
  BlocksSection _blocksSection;
  EntitiesSection _entitiesSection;
  ObjectsSection _objectsSection;

  int get nextHandle => _headerSection.nextHandle;

  void addEntities(AcDbEntity entity) {
    _entitiesSection.addEntity(entity);
    _headerSection.increase();
  }

  AcDbEntity getEntityByHandle(int handle) {
    return _entitiesSection.getEntityByHandle(handle);
  }

  void removeEntity(AcDbEntity entity) {
    _entitiesSection.removeEntity(entity);
  }

  DXF._init(String filePath) {
    _filePath = filePath;
  }

  Future<void> _parse() async {
    var codes = <GroupCode>[];
    _groupCodes.forEach((element) async {
      if (element.isSECTION) {
        codes = [];
        codes.add(element);
      } else if (codes.isNotEmpty) {
        codes.add(element);
        if (element.isENDSEC) {
          var _element = codes[1];
          assert(_element.code == 2);
          if (_element.isHEADER) {
            _headerSection = await HeaderSection.fromGroupCodes(codes);
          } else if (_element.isCLASSES) {
            _classesSection = await ClassesSection.fromGroupCodes(codes);
          } else if (_element.isTABLES) {
            _tablesSection = await TablesSection.fromGroupCodes(codes);
          } else if (_element.isBLOCKS) {
            _blocksSection = await BlocksSection.fromGroupCodes(codes);
          } else if (_element.isENTITIES) {
            _entitiesSection = await EntitiesSection.fromGroupCodes(codes);
          } else if (_element.isOBJECTS) {
            _objectsSection = await ObjectsSection.fromGroupCodes(codes);
          }
        }
      }
    });
  }

  Future _load(String filePath) async {
    var file = File(filePath);
    await file.readAsString().then((data) async {
      var lines = LineSplitter().convert(data);
      int code;
      await lines.forEach((dynamic value) async {
        if (code != null) {
          _groupCodes.add(GroupCode(code, value));
          code = null;
        } else {
          code = int.tryParse(value);
        }
      });
    }).catchError((onError) => print('Error, could not open file'));
  }

  static Future<DXF> create(String filePath) async {
    var _dxf = DXF._init(filePath);
    await _dxf._load('./seed_2007.dxf');
    await _dxf._parse();
    return _dxf;
  }

  static Future<DXF> load(String filePath) async {
    var _dxf = DXF._init(filePath);
    await _dxf._load(filePath);
    await _dxf._parse();
    return _dxf;
  }

  Future<void> save({String newPath}) async {
    var filePath = newPath ?? _filePath;
    var file = File(filePath);

    // Write the file.
    var fileHandle = file.openWrite(mode: FileMode.writeOnly);

    /// Header Section
    _headerSection.groupCodes.forEach((element) {
      fileHandle.writeln(element.code.toString().padLeft(3, ' '));
      fileHandle.writeln(element.value);
    });

    /// Classes Section
    _classesSection.groupCodes.forEach((element) {
      fileHandle.writeln(element.code.toString().padLeft(3, ' '));
      fileHandle.writeln(element.value);
    });

    /// Tables Section
    _tablesSection.groupCodes.forEach((element) {
      fileHandle.writeln(element.code.toString().padLeft(3, ' '));
      fileHandle.writeln(element.value);
    });

    /// Blocks Section
    _blocksSection.groupCodes.forEach((element) {
      fileHandle.writeln(element.code.toString().padLeft(3, ' '));
      fileHandle.writeln(element.value);
    });

    /// Entities Section
    fileHandle.writeln(_entitiesSection.dxfString);

    /// Objects Section
    _objectsSection.groupCodes.forEach((element) {
      fileHandle.writeln(element.code.toString().padLeft(3, ' '));
      fileHandle.writeln(element.value);
    });

    /// EOF
    fileHandle.writeln(0.toString().padLeft(3, ' '));
    fileHandle.writeln('EOF');

    await fileHandle.close();
  }
}
