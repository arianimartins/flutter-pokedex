class PokemonsRequest {
  int count;
  String next;
  Null previous;
  List<Pokemons> results;

  PokemonsRequest({this.count, this.next, this.previous, this.results});

  PokemonsRequest.fromJson(Map<dynamic, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Pokemons>();
      json['results'].forEach((v) {
        results.add(new Pokemons.fromJson(v));
      });
    }
  }

  Map<String, String> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemons{
  String name;
  String url;

  Pokemons({this.name, this.url});

  Pokemons.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}