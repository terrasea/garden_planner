library garden_planner.garden.plot_plant_create;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:garden_planner/src/plot/plot.dart';
import 'package:garden_planner/src/directives/highlight_directive.dart';

@Component(
    selector: 'garden-plot-plant-create',
    styleUrls: const ['plot_plant_create.css'],
    templateUrl: 'plot_plant_create.html',
    directives: [
      NgFor,
      materialInputDirectives,
      MaterialInputComponent,
      MaterialDateRangePickerComponent,
      MaterialDatepickerComponent,
      MaterialButtonComponent,
      MaterialIconComponent,
      HighlightDirective,
    ],
    providers: const [materialProviders],
    pipes: const [
      commonPipes,
    ]
)
class PlantPlotCreateComponent implements OnInit {
  @Input()
  PlotPlant plant;

  @Input()
  Plot plot;

  ngOnInit() {
    plant = new PlotPlant();
  }

  onClick(e) {
    if(plot.plants == null) {
      plot.plants = [];
    }
    if(plant != null) {
      plot.plants.add(plant);
    }
    plant = PlotPlant();
  }
}
