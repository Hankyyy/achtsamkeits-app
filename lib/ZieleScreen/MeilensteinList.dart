import 'package:flutter/material.dart';

import 'package:aaproto2/ZieleScreen/ZielClasses.dart';

List<Meilenstein> getMeilensteine() {
  return [
    Meilenstein(
      title: "Online Marketing",
      geplant: DateTime.now(),
      deadline: DateTime.now(),
      notizen: "Dies das",
      nummer: "0000001",
      aufgaben: getOMAufgaben(),

    ),
    Meilenstein(
      title: "Medienproduktion",
      geplant: DateTime.now(),
      deadline: DateTime.now(),
      notizen: "Dies das",
      nummer: "0000002",
      aufgaben: getOMAufgaben(),

    ),
    Meilenstein(
      title: "Führen im IT-Umfeld",
      geplant: DateTime.now(),
      deadline: DateTime.now(),
      notizen: "Dies das",
      nummer: "0000003",
      aufgaben: getOMAufgaben(),

    ),

  ];
}

List<Aufgabe> getOMAufgaben() {
  return[
    Aufgabe(
      title: "Vorlesung 3",
    ),
    Aufgabe(
      title: "Vorlesung 4",
    ),
    Aufgabe(
      title: "Übung 5",
    ),
    Aufgabe(
      title: "Praktikum 4",
    ),
  ];
}

List<Aufgabe> getMPAufgaben() {
  return[
    Aufgabe(
      title: "Vorlesung 9",
    ),
    Aufgabe(
      title: "Übung 2",
    ),
    Aufgabe(
      title: "Übung 3",
    ),
    Aufgabe(
      title: "Übung 5",
    ),
    Aufgabe(
      title: "Übung 6",
    ),
  ];
}

List<Aufgabe> getFITUAufgaben() {
  return[
    Aufgabe(
      title: "Vorlesung 7",
    ),
    Aufgabe(
      title: "Vorlesung 8",
    ),
  ];
}