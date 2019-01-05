import 'dart:html';

import 'package:angular/angular.dart';
import 'package:garden_planner/src/components/garden/plot.dart';
import 'package:garden_planner/src/components/garden/plot_create.dart';
import 'package:garden_planner/src/components/garden/plotlist.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [PlotCreateComponent, PlotComponent, PlotList, MyIdDirective],
  providers: const [],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}

@Directive(selector: '[myid]')
class MyIdDirective {
  Element _el;
  MyIdDirective(this._el);

  @HostListener('mouseenter')
  void onMouseEnter() {
    _set_border('black');
  }

  @HostListener('mouseleave')
  void onMouseLeave() {
    _unset_border();
  }

  void _set_border([String color]) {

    _el.style
      ..borderLeftStyle = 'solid'
      ..borderRightStyle = 'solid'
      ..borderColor = color
//      ..borderWidth = '5px'
    ;
  }

  void _unset_border([String color]) {

    _el.style
      ..borderStyle = 'none'
    ;
  }
}