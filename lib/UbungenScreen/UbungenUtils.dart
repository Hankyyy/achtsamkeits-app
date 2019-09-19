import 'package:flutter/material.dart';


class Ubung {
  int id;
  final String title;
  String quickTitle;
  String bereich;
  String wiederholungen;
  String anwendungsgebiet;
  String erklarung;
  String einleitung;
  String audioPath;
  String iconPath;
  Duration duration;

  var icon;

  Ubung({
    this.title,
    this.quickTitle,
    this.bereich,
    this.wiederholungen,
    this.anwendungsgebiet,
    this.erklarung,
    this.einleitung,
    this.icon,
    this.audioPath,
    this.iconPath,
    this.duration,
  }) : assert(title != null);
}

List<Ubung> getUbungen() {
  return [
    Ubung(
      title: "Atem Anker",
      quickTitle: "Atem Anker",
      bereich: "Achtsamkeit",
      wiederholungen: "3x täglich",
      anwendungsgebiet: "Achtsamkeit, Entspannung, Stressreduktion",
      erklarung:
          "Die folgende Übung soll dir bei akutem Stress helfen und deine Achtsamkeit erhöhen.",
      einleitung:
          "Für diese Übung wäre es gut, wenn du Stehen könntest und dein Rücken gerade ist. Sollte dies gerade nicht möglich sein, tut es auch ein Stuhl und eine bequeme Sitzposition, bei der dein Rücken gerade ist. Wenn du Zuhause bist, leg dich am besten hin.",
      icon: Icons.arrow_downward,
      audioPath: "Ubungen/atem_anker_audio.mp3",
      iconPath: "Icons/atem_anker_icon.png",
      duration: Duration(minutes: 7, seconds: 06),
    ),
    Ubung(
      title: "Body Scan",
      quickTitle: "Body Scan",
      bereich: "Achtsamkeit",
      wiederholungen: "1x täglich",
      anwendungsgebiet: "Achtsamkeit, Aufmerksamkeit, Entspannung",
      erklarung:
          "Diese Übung soll dir dabei helfen, die Aufmerksamkeit auf deinen Körper zu richten, um so deine Achtsamkeit zu steigern.",
      einleitung:
          "Wichtig: Diese Übung ist für fortgeschrittene Apes gedacht – je mehr Erfahrung du bereits sammeln konntest, desto besser wird dir diese Meditation helfen. \n\nFür diese Übung solltest du sitzen. Da diese Übung deine emotionale Intelligenz trainiert, bitte nimm im zweiten Teil den körperlichen Ausdruck deiner Gefühle besonders wahr.",
      icon: Icons.accessibility_new,
      audioPath: "Ubungen/bodyscan_audio.mp3",
      iconPath: "Icons/body_scan_icon.png",
      duration: Duration(minutes: 13, seconds: 50),
    ),
    Ubung(
      title: "Meditatives Zirkeltraining",
      quickTitle: "Meditatives\nZirkeltraining",
      bereich: "Entspannung, Achtsamkeit",
      wiederholungen: "Bei Anspannung\n",
      anwendungsgebiet: "Entspannung, Achtsamkeit",
      erklarung:
          "Bist du aktuell gestresst? Diese Übung kann dir dabei helfen, dich zu entspannen.",
      einleitung:
          "Bevor wir starten, nimm bitte eine bequeme Sitzposition ein, in der du entspannt und aufmerksam zugleich sein kannst. Wie diese Position aussieht, entscheidest du.",
      icon: Icons.trip_origin,
      audioPath: "Ubungen/meditatives_zirkeltraining_audio.mp3",
      iconPath: "",
      duration: Duration(minutes: 12, seconds: 12),
    ),
    Ubung(
      title: "3 Minuten Taucher",
      quickTitle: "3 Minuten\nTaucher",
      bereich: "Achtsamkeit",
      wiederholungen: "2-3x täglich",
      anwendungsgebiet: "Achtsamkeit, Entspannung, Fokus, positives Denken",
      erklarung:
          "Positive Gedanken gefällig? Oft kommt das positive Denken in unserem Alltag zu kurz, obwohl es so wichtig ist. Mit dieser Übung möchten wir dir dabei helfen, mehr positives Denken in deinen Alltag zu integrieren.",
      einleitung:
          "Solltest du aktuell gestresst sein, oder positive Gedanken benötigen, hilft dir der 3 Minuten Taucher enorm weiter (auch, wenn er ca. 5 Minuten dauert). Für diese Übung solltest du eine bequeme Sitzposition einnehmen.",
      icon: Icons.timer,
      audioPath: "Ubungen/drei_minuten_taucher_audio.mp3",
      iconPath: "Icons/drei_minuten_taucher_icon.png",
      duration: Duration(minutes: 4, seconds: 02),
    ),
    Ubung(
      title: "Blick Fokussieren",
      quickTitle: "Blick\nFokussieren",
      bereich: "Achtsamkeit, Entspannung",
      wiederholungen: "bei fehlendem Fokus empfohlen",
      anwendungsgebiet: "Entspannung, Achtsamkeit",
      erklarung: "Du bist gerade mit einer wichtigen Abgabe beschäftigt oder lernst schon eine Weile für anstehende Klausuren?\n\nDu bist nicht müde, aber es fällt dir schwer, dich zu 100% zu konzentrieren? Dann ist diese Übung genau das Richtige, um wieder mehr Fokus zu erhalten.",
      einleitung: "Diese Übung soll dir dabei helfen, den Fokus beim lernen wieder zu erlangen. Wenn du dich gerade nicht konzentrieren kannst, ist diese Übung genau das richtige. ",
      icon: Icons.remove_red_eye,
      audioPath: "Ubungen/blick_fokussieren_audio.mp3",
      iconPath: "Icons/blick_fokussieren_icon.png",
      duration: Duration(minutes: 1, seconds: 24),
    ),
    Ubung(
      title: "coming soon...",
      quickTitle: "coming soon...",
      bereich: "coming soon...",
      wiederholungen: "coming soon...",
      anwendungsgebiet: "coming soon...",
      erklarung: "coming soon...",
      einleitung: "coming soon...",
      icon: Icons.insert_invitation,
      audioPath: "Ubungen/atem_anker_audio.mp3",
      iconPath: "",
    ),
    Ubung(
      title: "coming soon...",
      quickTitle: "coming soon...",
      bereich: "coming soon...",
      wiederholungen: "coming soon...",
      anwendungsgebiet: "coming soon...",
      erklarung: "coming soon...",
      einleitung: "coming soon...",
      icon: Icons.insert_invitation,
      audioPath: "Ubungen/atem_anker_audio.mp3",
      iconPath: "",
    ),
    Ubung(
      title: "coming soon...",
      quickTitle: "coming soon...",
      bereich: "coming soon...",
      wiederholungen: "coming soon...",
      anwendungsgebiet: "coming soon...",
      erklarung: "coming soon...",
      einleitung: "coming soon...",
      icon: Icons.insert_invitation,
      audioPath: "Ubungen/atem_anker_audio.mp3",
      iconPath: "",
    ),
    Ubung(
      title: "coming soon...",
      quickTitle: "coming soon...",
      bereich: "coming soon...",
      wiederholungen: "coming soon...",
      anwendungsgebiet: "coming soon...",
      erklarung: "coming soon...",
      einleitung: "coming soon...",
      icon: Icons.insert_invitation,
      audioPath: "Ubungen/atem_anker_audio.mp3",
      iconPath: "",
    ),
  ];
}
