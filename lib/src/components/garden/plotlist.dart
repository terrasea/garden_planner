library garden_planner.garden.plotlist;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:garden_planner/src/plot/plot.dart';
import 'package:garden_planner/src/components/garden/plot.dart';
import 'package:garden_planner/src/components/garden/plot_create.dart';

@Component(
  selector: 'garden-plotlist',
  styleUrls: const ['plotlist.css'],
  templateUrl: 'plotlist.html',
  directives: [
//    NgIf,
    NgFor,
    MaterialListComponent,
    MaterialListItemComponent,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialDialogComponent,
    ModalComponent,
    PlotCreateComponent,
    PlotComponent,
  ],
  providers: const [overlayBindings],
)
class PlotList {
  bool addPlot = false;

  List<Plot> plots = [];

  onAddPlot(Plot plot) {
    plots.add(plot);
    addPlot = false;
  }

}