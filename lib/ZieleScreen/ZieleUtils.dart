class Meilenstein {
  final String title;
  List<Aufgabe> aufgaben;
  List<Aufgabe> erledigteAufgaben;
  List<Aufgabe> alleAufgaben;
  DateTime geplant;
  DateTime deadline;
  String notizen;
  String nummer;

  List getAufgaben() {
    return aufgaben;
  }
  List getErledigteAufgaben() {
    return erledigteAufgaben;
  }

  List getAlleAufgaben() {
    List<Aufgabe> aA = aufgaben + erledigteAufgaben;
    aA.sort((a, b){
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
    return aA;
  }


  Meilenstein({
    this.title,
    this.aufgaben,
    this.erledigteAufgaben,
    this.geplant,
    this.deadline,
    this.notizen,
    this.nummer,
  }) : assert(title != null);
}

class Aufgabe {
  final String title;
  String meilensteinnummer;
  DateTime geplant;
  String notizen;

  Aufgabe({
    this.title,
    this.meilensteinnummer,
    this.geplant,
    this.notizen,
  }) : assert(title != null);
}

List<Meilenstein> getMeilensteine() {
  return [
    Meilenstein(
      title: "Online Marketing",
      geplant: DateTime(2019, 08, 14),
      deadline: DateTime(2019, 08, 14),
      notizen: "Zweitversuch!!! Klausur zählt 50%.",
      nummer: "0000001",
      aufgaben: getOMAufgaben(),
      erledigteAufgaben: getOMerledigteAufgaben(),
    ),
    Meilenstein(
      title: "Medienproduktion",
      geplant: DateTime(2019, 08, 14),
      deadline: DateTime(2019, 08, 14),
      notizen: "",
      nummer: "0000002",
      aufgaben: getMPAufgaben(),
      erledigteAufgaben: getMPerledigteAufgaben(),
    ),
    Meilenstein(
      title: "Führen im IT-Umfeld",
      geplant: DateTime(2019, 08, 14),
      deadline: DateTime(2019, 08, 14),
      notizen: "Hier noch mehr Notizen!!1 Kaufen Sie jetzt APE!",
      nummer: "0000003",
      aufgaben: getFITUAufgaben(),
      erledigteAufgaben: getFITUerledigteAufgaben(),
    ),
  ];
}

List<Aufgabe> getOMAufgaben() {
  return [
    Aufgabe(
      title: "Vorlesung 3",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Vorlesung 4",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Übung 5",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Praktikum 4",
      geplant: DateTime(2019, 08, 14),
    ),
  ];
}

List<Aufgabe> getOMerledigteAufgaben() {
  return [
    Aufgabe(
      title: "Vorlesung 1",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Vorlesung 2",
      geplant: DateTime(2019, 08, 14),
    ),
  ];
}

List<Aufgabe> getMPAufgaben() {
  return [
    Aufgabe(
      title: "Vorlesung 9",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Übung 2",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Übung 3",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Übung 5",
      geplant: DateTime(2019, 08, 14),
    ),
    Aufgabe(
      title: "Übung 6",
      geplant: DateTime(2019, 08, 14),
    ),
  ];
}

List<Aufgabe> getMPerledigteAufgaben() {
  return [
    Aufgabe(
      title: "Vorlesung 8",
      geplant: DateTime(2019, 08, 14),
    ),
  ];
}

List<Aufgabe> getFITUAufgaben() {
  return [
    Aufgabe(
      title: "Vorlesung 7",
      geplant: DateTime(2019, 08, 14),

    ),
    Aufgabe(
      title: "Vorlesung 8",
      geplant: DateTime(2019, 08, 14),
    ),
  ];
}

List<Aufgabe> getFITUerledigteAufgaben() {
  return [
    Aufgabe(
      title: "Vorlesung 6",
      geplant: DateTime(2019, 08, 14),
    ),
  ];
}