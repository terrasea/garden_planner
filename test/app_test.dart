library garden_planner.tests;

@TestOn('browser')

import 'dart:convert';
import 'package:angular_test/angular_test.dart';
import 'package:angular_components/angular_components.dart' show Date;
import 'package:test/test.dart';

import 'package:garden_planner/app_component.dart';
import 'package:garden_planner/app_component.template.dart' as ng;

import 'package:garden_planner/src/plot/plot.dart';

part 'plot_stuff.dart';

void main() {
  NgTestFixture<AppComponent> fixture;
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);

  setUp(() async {
    fixture = await testBed.create();
  });
  tearDown(disposeAnyRunningTest);

  tearDown(disposeAnyRunningTest);

  test('title', () async {

  });

  plot_test();
  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}

