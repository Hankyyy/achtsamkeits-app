//#####################new created Yannick

class Sleep{
  String name, beschreibung;
  double anzahl;

  Sleep(this.name, this. beschreibung, this.anzahl);

  Sleep.fromMap(Map map){
    this.name = map["name"];
    this.beschreibung = map["beschreibung"];
    this.anzahl = map["anzahl"];
  }
}