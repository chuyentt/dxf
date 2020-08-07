import 'dart:convert';
import 'package:universal_io/io.dart';

import 'classes/group_code.dart';
import 'classes/section.dart';
import 'classes/header_section/header_section.dart';
import 'classes/classes_section/classes_section.dart';
import 'classes/tables_section/tables_section.dart';
import 'classes/blocks_section/blocks_section.dart';
import 'classes/entities_section/entities_section.dart';
import 'classes/objects_section/objects_section.dart';
import 'classes/thumbnailimage_section/thumbnailimage_section.dart';

/// DXF abstract class
abstract class DXF {
  String _path;
  String get path => _path;

  // final HeaderSection _headerSection = HeaderSection();
  // HeaderSection get header => _headerSection;

  // final ClassesSection _classesSection = ClassesSection();
  // ClassesSection get classes => _classesSection;

  // final TablesSection _tablesSection = TablesSection();
  // TablesSection get tables => _tablesSection;

  // final BlocksSection _blocksSection = BlocksSection();
  // BlocksSection get blocks => _blocksSection;

  // final EntitiesSection _entitiesSection = EntitiesSection();
  // EntitiesSection get entities => _entitiesSection;

  // final ObjectsSection _objectsSection = ObjectsSection();
  // ObjectsSection get objects => _objectsSection;

  // final ThumbnailimageSection _thumbnailImageSection = ThumbnailimageSection();
  // ThumbnailimageSection get thumbnailImage => _thumbnailImageSection;

  final List<UndefinedSection> _undefinedSections = <UndefinedSection>[];
  List<UndefinedSection> get undefinedSections => _undefinedSections;

  /// Create new DXF file with path
  static Future<DXF> create(String path) async {
    var dxf = _DXF();
    dxf._path = path;
    var file = File('./lib/src/seed_2007.dxf');
    await file.readAsString().then((data) async {
      var ls = LineSplitter();
      var lines = ls.convert(data);
      var keyFlag = false;
      var groupCodes = <GroupCode>[];
      var key;
      await lines.forEach((onValue) async {
        keyFlag = !keyFlag;
        if (keyFlag) {
          key = onValue.trim();
        } else {
          groupCodes.add(GroupCode(key: int.parse(key), value: onValue));
        }
      });
      await dxf._parse(groupCodes);
    }).catchError((onError) => print('Error, could not open seed file'));
    return dxf;
  }

  /// Read a DXF file from path
  static Future<DXF> load(String path) async {
    var file = File(path);
    var dxf = _DXF();
    dxf._path = path;
    await file.readAsString().then((data) async {
      var ls = LineSplitter();
      var lines = ls.convert(data);
      var keyFlag = false;
      var groupCodes = <GroupCode>[];
      var key;
      await lines.forEach((onValue) async {
        keyFlag = !keyFlag;
        if (keyFlag) {
          key = onValue.trim();
        } else {
          groupCodes.add(GroupCode(key: int.parse(key), value: onValue));
        }
      });
      await dxf._parse(groupCodes);
    }).catchError((onError) => print('Error, could not open file'));
    return dxf;
  }

  /// Save DXF data to path or new path
  Future<File> save({String newPath}) async {
    var filePath = newPath ?? path;
    var file = File(filePath);
    // Write the file.
    return file.writeAsString(dxfString);
  }

  /// Return DXF String by group codes
  String get dxfString {
    var str = '';
    // str += header.dxfString;
    // str += classes.dxfString;
    // str += tables.dxfString;
    // str += blocks.dxfString;
    // str += entities.dxfString;
    // str += objects.dxfString;
    // str += thumbnailImage.dxfString;
    for (var section in _undefinedSections) {
      str += section.dxfString;
    }
    return str + '0\r\nEOF';
  }
}

/// DXF private class
class _DXF extends DXF {
  void _parse(List<GroupCode> groupCodes) {
    if (groupCodes.length < 4 && groupCodes.length % 2 != 0) return null;

    var codes = <GroupCode>[];

    groupCodes.forEach((groupCode) {
      if (groupCode.isSECTION) {
        codes.add(groupCode);
      } else if (groupCode.isENDSEC) {
        var code = codes[1];
        if (code.key == 2) {
          codes.add(groupCode);
          // if (code.isHEADER) {
          //   _headerSection.parse(codes);
          //   //print(_headerSection.dxfString);
          // } else if (code.isCLASSES) {
          //   _classesSection.parse(codes);
          //   //print(_classesSection.dxfString);
          // } else if (code.isTABLES) {
          //   _tablesSection.parse(codes);
          //   //print(_tablesSection.dxfString);
          // } else if (code.isBLOCKS) {
          //   _blocksSection.parse(codes);
          //   //print(_blocksSection.dxfString);
          // } else if (code.isENTITIES) {
          //   _entitiesSection.parse(codes);
          //   //print(_entitiesSection.dxfString);
          // } else if (code.isOBJECTS) {
          //   _objectsSection.parse(codes);
          //   //print(_objectsSection.dxfString);
          // } else if (code.isTHUMBNAILIMAGE) {
          //   _thumbnailImageSection.parse(codes);
          //   //print(_thumbnailImageSection.dxfString);
          // } else {
          var undefinedSection = UndefinedSection();
          undefinedSection.groupCodes = codes;
          _undefinedSections.add(undefinedSection);
          // }
        }
        codes = <GroupCode>[];
      } else {
        codes.add(groupCode);
      }
    });
  }
}
