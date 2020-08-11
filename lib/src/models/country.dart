class Country {
  List<String> items = new List();

  Country();

  /*Country.fromJson2(List<dynamic> json) {
    if (json == null) return;
    for (var i in json) {
      final country = i.toString();
      items.add(country);
    }
  }*/

  Country.fromJson(Map<String, dynamic> json) {
    final response = json['response'];
    if (response == null) return;
    items = List<String>.from(response);
  }
}
