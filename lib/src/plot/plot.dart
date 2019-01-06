library garden_planner.plot.plot;

import 'dart:convert';

import 'package:intl/intl.dart' show DateFormat;

import 'package:angular_components/angular_components.dart' show Date;

class Plot {
  var id;
  String name;
  Date date;
  var plants;

  static final date_format = new DateFormat('yyyy.m.d');

  Plot({
    this.name,
    this.date,
    this.plants
  });

  factory Plot.fromJson(String jsonStr) {
    Map json = jsonDecode(jsonStr);

    return new Plot.fromMap(json);
  }

  factory Plot.fromMap(Map json) {
    return new Plot(
      name: json.putIfAbsent('name', () => 'unknown'),
      date: new Date.parse(
        json.putIfAbsent('date', () => new Date.today().format(date_format)),
        date_format
      ),
      plants: json.putIfAbsent('plants', () => []).map((plant) => new PlotPlant.fromMap(plant)),
    );
  }

  toMap() => {
    'name': name,
    'date': date != null ? date.format(date_format) : new Date.today().format(date_format),
    'plants': plants != null ? plants.map((plant) => plant.toMap()).toList() : [],
  };

  toJson() {
    return jsonEncode(toMap());
  }

  @override
  String toString() {
    return toJson();
  }
}

class PlotPlant {
  String common_name;
  Date sow_plant_date;
  PlantMetadata metadata;

  static final date_format = new DateFormat('yyyy.m.d');

  PlotPlant(
      {
        this.common_name,
        this.sow_plant_date,
        this.metadata,
      }
  );

  factory PlotPlant.fromJson(String jsonStr) {
    Map json = jsonDecode(jsonStr);

    return new PlotPlant.fromMap(json);
  }

  factory PlotPlant.fromMap(Map json) {
    return new PlotPlant(
        common_name: json.putIfAbsent('common_name', () => 'unknown'),
        sow_plant_date: new Date.parse(
            json.putIfAbsent('sow_plant_date', () => new Date.today().format(date_format)),
            date_format
        ),
        metadata: new PlantMetadata.fromMap(json.putIfAbsent('metadata', () => {}))
    );
  }

  toMap() => {
    'common_name': common_name,
    'sow_plant_date': sow_plant_date != null ? sow_plant_date.format(date_format) : new Date.today().format(date_format),
    'metadata': metadata != null ? metadata.toMap() : {},
  };

  toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return toJson();
  }
}

class PlantMetadata {
  String family;
  String scientific_name;

  PlantMetadata(
      {
        this.family,
        this.scientific_name,
      }
  );

  factory PlantMetadata.fromJson(String jsonStr) {
    Map json = jsonDecode(jsonStr);
    return new PlantMetadata.fromMap(json);
  }

  factory PlantMetadata.fromMap(Map json) {
    return new PlantMetadata(
        family: json.putIfAbsent('family', () => ''),
        scientific_name: json.putIfAbsent('scientific_name', () => '')
    );
  }

  toMap() => {
    'family': family,
    'scientific_name': scientific_name,
  };

  toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return toJson();
  }
}