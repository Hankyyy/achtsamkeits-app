class Meilenstein {
  final String title;
  List<Aufgabe> aufgaben;
  DateTime geplant;
  DateTime deadline;
  String notizen;
  String nummer;

  Meilenstein(
      {this.title,
        this.aufgaben,
        this.geplant,
        this.deadline,
        this.notizen,
        this.nummer,}) : assert(title != null);
}

class Aufgabe {
  final String title;
  String meilensteinnummer;
  DateTime geplant;
  DateTime deadline;
  String notizen;

  Aufgabe(
      {this.title,
        this.meilensteinnummer,
        this.geplant,
        this.deadline,
        this.notizen,}) : assert(title != null);
}