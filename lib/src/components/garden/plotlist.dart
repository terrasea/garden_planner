library garden_planner.garden.plotlist;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:garden_planner/src/plot/plot.dart';
import 'package:garden_planner/src/components/garden/plot.dart';
import 'package:garden_planner/src/components/garden/plot_create.dart';
import 'package:garden_planner/src/services/garden.dart';

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
  providers: const [overlayBindings, GardenService],
)
class PlotList implements OnInit {
  final GardenService _gardenService;

  bool addPlot = false;
  bool _hasNoPlots = false;
  bool get hasNoPlots => _hasNoPlots || plots != null && plots.length == 0;
  void set hasNoPlots(val) => _hasNoPlots = val;

  List<Plot> plots;

  PlotList(this._gardenService);

  ngOnInit() async {
    plots = await _gardenService.getAll();
  }

  onAddPlot(Plot plot) {
    plots.add(plot);
    addPlot = false;
    hasNoPlots = false;
  }

  saveGarden(e) async {
    await _gardenService.addPlots(plots);
  }

  deletePlot(plot) async {
    await _gardenService.deletePlot(plot);
    plots.remove(plot);
  }
}