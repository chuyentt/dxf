/// The DXF™ format is a tagged data representation of all the information contained in an AutoCAD ®  drawing file.
/// Tagged data means that each data element in the file is preceded by an integer number that is called a group code.
class GroupCode {
  final int key;
  dynamic value;
  GroupCode({this.key, this.value});

  static GroupCode fromMap(Map data) {
    int key = data.keys.first;
    dynamic value = data.values.first;
    return GroupCode(key: key, value: value);
  }

  String get dxfString {
    return '$key\r\n$value\r\n';
  }

  bool get isSECTION {
    return key == 0 && value == 'SECTION';
  }

  bool get isENDSEC {
    return key == 0 && value == 'ENDSEC';
  }

  bool get isHEADER {
    return key == 2 && value == 'HEADER';
  }

  bool get isCLASSES {
    return key == 2 && value == 'CLASSES';
  }

  bool get isTABLES {
    return key == 2 && value == 'TABLES';
  }

  bool get isBLOCKS {
    return key == 2 && value == 'BLOCKS';
  }

  bool get isENTITIES {
    return key == 2 && value == 'ENTITIES';
  }

  bool get isOBJECTS {
    return key == 2 && value == 'OBJECTS';
  }

  bool get isTHUMBNAILIMAGE {
    return key == 2 && value == 'THUMBNAILIMAGE';
  }
}
