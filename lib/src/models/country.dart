class Country {
  List<String> items = new List();

  Country();

  Country.fromJson(List<dynamic> json) {
    if (json == null) return;

    for (var i in json) {
      final country = i.toString();
      items.add(country);
    }
  }
}
