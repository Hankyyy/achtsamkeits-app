
class Produktivitaet {
  int id;
  int pWert;

  Produktivitaet({
    this.id,
    this.pWert
  });

  Map toMap() {
    Map map = {
      'pWert': pWert
    };
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map){
    Produktivitaet p = new Produktivitaet();
    p.id = map['id'];
    p.pWert = map['pWert'];

    return p;
  }
}
