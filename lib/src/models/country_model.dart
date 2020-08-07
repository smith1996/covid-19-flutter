class Countries {
  List<String> items = new List();

  Countries();

  Countries.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var i in jsonList) {
      final country = i.toString();
      items.add(country);
    }
  }
}
