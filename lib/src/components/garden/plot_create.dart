library garden_planner.garden.plot_create;

import 'dart:async' show StreamController, Timer;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:garden_planner/src/components/garden/plot_plant_create.dart';
import 'package:garden_planner/src/plot/plot.dart';

import 'package:garden_planner/src/pipes/dict_key_values.dart';
import 'package:garden_planner/src/directives/highlight_directive.dart';

@Component(
    selector: 'garden-plot-create',
    styleUrls: const ['plot_create.css'],
    templateUrl: 'plot_create.html',
    directives: [
      NgFor,
      NgIf,
      materialInputDirectives,
      MaterialInputComponent,
      MaterialDateRangePickerComponent,
      MaterialDatepickerComponent,
      MaterialListComponent,
      MaterialListItemComponent,
      MaterialButtonComponent,
      MaterialIconComponent,
      PlantPlotCreateComponent,
      HighlightDirective,
    ],
    providers: const [materialProviders],
    pipes: const [
      commonPipes,
      KeyValue,
    ]
)
class PlotCreateComponent implements OnInit {

  StreamController<Plot> _plotAdd = new StreamController<Plot>();
  @Output()
  Stream<Plot> get onPlotAdd => _plotAdd.stream;

  StreamController<void> _cancel = new StreamController<void>();
  @Output()
  Stream<void> get onCancel => _cancel.stream;

  Plot plot;

  ngOnInit() {
    plot = new Plot();
  }

  addPlot(e) {
    if(plot.name != null && plot.name.length > 0) {
      _plotAdd.add(plot);
      plot = null;
      plot = new Plot();
    }
  }

  cancel(e) {
    _cancel.add(null);
    plot = null;
    plot = new Plot();
  }
}
