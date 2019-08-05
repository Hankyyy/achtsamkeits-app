
class Gefuehle {
  int id;
  int gWert;

  Gefuehle({
    this.id,
    this.gWert
  });

  Map toMap() {
    Map map = {
      'gWert': gWert
    };
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map){
    Gefuehle g = new Gefuehle();
    g.id = map['id'];
    g.gWert = map['gWert'];

    return g;
  }
}
