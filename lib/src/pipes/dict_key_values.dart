library garden_planner.pipes;

import 'package:angular/angular.dart';

@Pipe('keyValue')
class KeyValue extends PipeTransform {
  transform(Map map, String key) => map != null ? map.putIfAbsent(key, () => '') : '';
}