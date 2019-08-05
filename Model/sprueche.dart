
class Zitate {
  int id;
  String zitat;


  Zitate({
    this.id,
    this.zitat
  });


  static fromMap(Map map){
    Zitate z = new Zitate();
    z.id = map['id'];
    z.zitat = map['zitat'];

    return z;
  }
}
