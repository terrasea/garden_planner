part of garden_planner.tests;

void plot_test() {
  group('[PlantMetadata]', () {
    PlantMetadata metadata;
    setUp(() {
      metadata = new PlantMetadata(
        family: 'test family',
        scientific_name: 'test scientific',
      );
    });


    tearDown(() {
      metadata = null;
    });


    test('plant info create from map has correct family_name', () {
      expect(metadata.family, 'test family');
    });


    test('plant info create from map has correct scientific_name', () {
      expect(metadata.scientific_name, 'test scientific');
    });


    test('toJson works', () {
      var expected = jsonEncode({
        'family': 'test family',
        'scientific_name': 'test scientific',
      });

      expect(metadata.toJson(), expected);
    });


    test('toMap works', () {
      var expected = {
        'family': 'test family',
        'scientific_name': 'test scientific',
      };

      expect(metadata.toMap(), expected);
    });
  });

  group('[PlotPlant]', () {
    PlotPlant plant;
    PlantMetadata metadata;
    setUp(() {
      metadata = new PlantMetadata(
        family: 'test family',
        scientific_name: 'test scientific',
      );
      plant = new PlotPlant(
        common_name: 'plant',
        sow_plant_date: new Date(2018),
        metadata: metadata,
      );
    });

    tearDown(() {
      metadata = null;
      plant = null;
    });

    test('common_name correct', () {
      expect(plant.common_name, 'plant');
    });

    test('sow_plant_date correct', () {
      expect(plant.sow_plant_date, new Date(2018));
    });

    test('metadata correct', () {
      var copy_metadata = new PlantMetadata(
        family: 'test family',
        scientific_name: 'test scientific',
      );
      expect(plant.metadata.toString(), copy_metadata.toString());
    });
  });

  group('[Plot]', () {
    Plot plot;
    List<PlotPlant> plants = new List.generate(
        5,
        (index) => new PlotPlant(
          common_name: 'plant ${index}'
        )
    );
    setUp(() {
      plot = new Plot(
        name: 'plot',
        date: new Date(2019),
        plants: plants,
      );
    });

    tearDown(() {
      plot = null;
      plants = null;
    });

    test('correct name', () {
      expect(plot.name, 'plot');
    });

    test('correct date', () {
      expect(plot.date, new Date(2019));
    });
  });
}