/*
Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

import 'package:huawei_map/constants/param.dart';
import 'package:meta/meta.dart' show required;
import 'dart:ui' show hashValues;

import 'package:huawei_map/utils/toJson.dart';
import 'package:huawei_map/components/components.dart';

class CameraPosition {
  final double bearing;
  final LatLng target;
  final double tilt;
  final double zoom;

  const CameraPosition({
    this.bearing = 0.0,
    @required this.target,
    this.tilt = 0.0,
    this.zoom = 0.0,
  });

  dynamic toMap() => <String, dynamic>{
        Param.bearing: bearing,
        Param.target: latLngToJson(target),
        Param.tilt: tilt,
        Param.zoom: zoom,
      };

  static CameraPosition fromMap(dynamic json) {
    if (json == null) return null;

    return CameraPosition(
      bearing: json[Param.bearing],
      target: LatLng.fromJson(json[Param.target]),
      tilt: json[Param.tilt],
      zoom: json[Param.zoom],
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final CameraPosition check = other;
    return bearing == check.bearing &&
        target == check.target &&
        tilt == check.tilt &&
        zoom == check.zoom;
  }

  @override
  int get hashCode => hashValues(bearing, target, tilt, zoom);
}
