library garden_planner.garden.plot;

import 'dart:async' show StreamController;
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';

import 'package:garden_planner/src/pipes/dict_key_values.dart';
import 'package:garden_planner/src/plot/plot.dart';

import 'package:garden_planner/src/components/garden/plot_edit.dart';

@Component(
  selector: 'garden-plot',
  styleUrls: const ['plot.css'],
  templateUrl: 'plot.html',
  directives: [
    NgIf,
    NgFor,
    HighlightDirective,
    MaterialListComponent,
    MaterialListItemComponent,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialDialogComponent,
    ModalComponent,
    PlotEditComponent,
  ],
  providers: const [materialProviders],
  pipes: const [
    commonPipes,
    KeyValue
  ]
)
class PlotComponent {
  bool editPlot = false;

  StreamController<Plot> _plotDelete = new StreamController<Plot>();
  @Output()
  Stream<Plot> get onPlotDelete => _plotDelete.stream;

  StreamController<Plot> _plotEdit = new StreamController<Plot>();
  @Output()
  Stream<Plot> get onPlotEdit => _plotDelete.stream;

  @Input()
  Plot plot;

  deletePlot(e) {
    _plotDelete.add(plot);
  }

  savePlot(e) {
    print(e);
  }

  deletePlant(e) {
    print(e);
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
