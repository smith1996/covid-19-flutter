class History {
  List<Infected> items = new List();

  History();

  History.fromJson(Map<String, dynamic> json) {
    final response = json['response'];
    if (response == null) return;
    response.forEach((item) {
      final infected = Infected.fromJson(item);
      items.add(infected);
    });
  }
}

class Infected {
  String continent;
  int population;
  Cases cases;
  Deaths deaths;
  String day;
  String time;

  Infected({
    this.continent,
    this.population,
    this.cases,
    this.deaths,
    this.day,
    this.time,
  });

  Infected.fromJson(Map<String, dynamic> json) {
    continent = json['continent'];
    population = json['population'];
    cases = Cases.fromJson(json['cases']);
    deaths = Deaths.fromJson(json['deaths']);
    day = json['day'];
    time = json['time'];
  }
}

class Cases {
  int active;
  int critical;
  int recovered;
  int total;

  Cases({
    this.active,
    this.critical,
    this.recovered,
    this.total,
  });

  Cases.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    critical = json['critical'];
    recovered = json['recovered'];
    total = json['total'];
  }
}

class Deaths {
  int total;

  Deaths({
    this.total,
  });

  Deaths.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }
}
