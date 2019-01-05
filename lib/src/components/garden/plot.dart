library garden_planner.garden.plot;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';

import 'package:garden_planner/src/pipes/dict_key_values.dart';
import 'package:garden_planner/src/plot/plot.dart';

@Component(
  selector: 'garden-plot',
  styleUrls: const ['plot.css'],
  templateUrl: 'plot.html',
  directives: [
//    NgIf,
    NgFor,
    HighlightDirective,
    MaterialListComponent,
    MaterialListItemComponent
  ],
  providers: const [materialProviders],
  pipes: const [
    commonPipes,
    KeyValue
  ]
)
class PlotComponent implements OnInit {
  @Input()
  Plot plot;

  ngOnInit() {
    print(plot.name);
  }
}

@Directive(selector: '[myHighlight]')
class HighlightDirective {
  final Element _el;

  HighlightDirective(this._el);

  @HostListener('mouseenter')
  void onMouseEnter() {
    _highlight('yellow');
  }

  @HostListener('mouseleave')
  void onMouseLeave() {
    _highlight();
  }

  void _highlight([String color]) {
    _el.style.backgroundColor = color;
  }
}
