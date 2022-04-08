// Copyright (c) 2020 Hanoi University of Mining and Geology, Vietnam. Please
// see the AUTHOR file for details. All rights reserved. Use of this source
// code is governed by a MIT license that can be found in the LICENSE file.

/// A comprehensive, cross-platform DXF manipulation library.
library dxf;

import 'dart:convert';

part 'src/dxf_base.dart';
part 'src/datamodels/group_code.dart';
part 'src/datamodels/ac_db_circle.dart';
part 'src/datamodels/ac_db_ellipse.dart';
part 'src/datamodels/ac_db_arc.dart';
part 'src/datamodels/ac_db_point.dart';
part 'src/datamodels/ac_db_line.dart';
part 'src/datamodels/ac_db_polyline.dart';
part 'src/datamodels/ac_db_solid.dart';
part 'src/datamodels/ac_db_text.dart';
part 'src/datamodels/ac_db_mtext.dart';
part 'src/datamodels/ac_db_entity.dart';
part 'src/sections/blocks_section.dart';
part 'src/sections/classes_section.dart';
part 'src/sections/entities_section.dart';
part 'src/sections/header_section.dart';
part 'src/sections/objects_section.dart';
part 'src/sections/tables_section.dart';
