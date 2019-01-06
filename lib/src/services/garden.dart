library garden_planner.services.garden;

import 'dart:indexed_db';
import 'dart:html';

import 'package:angular/angular.dart' show Injectable;

import 'package:garden_planner/src/plot/plot.dart' show Plot, PlotPlant;

@Injectable()
class GardenService {
  final _storage = new Storage();

  Future<List<Plot>> getAll() async {
    return await _storage.getAllPlots();
  }

  Future<bool> addPlots(List<Plot> plots) async {
    await _storage.addAll(plots);

    return Future.delayed(Duration(seconds: 2), () => true);
  }
}

class Storage {
  final MILESTONE_STORE = 'garden';
  final NAME_INDEX = 'plots';
  final KEY_NAME = 'plot';
  Database _database;
  Future _loadedDB;

  Storage() {
    _loadedDB = _open();
  }

  _open() async {
    _database = await window.indexedDB.open(
        MILESTONE_STORE,
        version: 1,
        onUpgradeNeeded: _initializeDatabase
    );

    return _database;
  }

  _initializeDatabase(VersionChangeEvent e) async {
    Database db = (e.target as Request).result;

    var objectStore = db.createObjectStore(
        MILESTONE_STORE,
        autoIncrement: true
    );
    objectStore.createIndex(NAME_INDEX, KEY_NAME, unique: true);
  }

  Future<List<Plot>> getAllPlots() async {
    await _loadedDB;

    List<Plot> plots = [];

    var trans = _database.transaction(MILESTONE_STORE, 'readonly');
    var store = trans.objectStore(MILESTONE_STORE);

    var cursors = store.openCursor(autoAdvance: true).asBroadcastStream();
    cursors.listen((cursor) {
      var plot = new Plot.fromJson(cursor.value);
      plot.id = cursor.key;
      plots.add(plot);
    });

    return plots;
  }

  addAll(List<Plot> plots) async {
    for(var plot in plots) {
      await _addPlot(plot);
    }
  }

  _addPlot(Plot plot) async {
    var trans = _database.transaction(MILESTONE_STORE, 'readwrite');
    var store = trans.objectStore(MILESTONE_STORE);

    var key = await store.add(plot.toJson());

    plot.id = key;

    return trans.completed;
  }
}