import 'package:flutter/material.dart';

import 'package:aaproto2/UbungenScreen/UbungenClass.dart';

List<Ubung> getUbungen() {
  return [
    Ubung(
      title: "Atem Anker",
      bereich: "Achtsamkeit\n",
      wiederholungen: "3x täglich\n",
      anwendungsgebiet: "Achtsamkeit, Entspannung, Stressreduktion",
      dauer: 7.0,
      erklarung:
          "Die folgende Übung soll dir bei akutem Stress helfen und deine Achtsamkeit erhöhen.",
      einleitung:
          "\nFür diese Übung wäre es gut, wenn du Stehen könntest und dein Rücken gerade ist. Sollte dies gerade nicht möglich sein, tut es auch ein Stuhl und eine bequeme Sitzposition, bei der dein Rücken gerade ist. Wenn du Zuhause bist, leg dich am besten hin.",
      icon: Icons.arrow_downward,
    ),
    Ubung(
      title: "Body Scan",
      bereich: "Achtsamkeit",
      wiederholungen: "1x täglich\n",
      anwendungsgebiet: "Achtsamkeit, Aufmerksamkeit, Entspannung",
      dauer: 20.0,
      erklarung:
          "Bist du aktuell gestresst? Das Meditative Zirkeltraining kann dir dabei helfen, dich zu entspannen.",
      einleitung:
          "\nWichtig: Diese Übung ist für fortgeschrittene Apes gedacht – je mehr Erfahrung du bereits sammeln konntest, desto besser wird dir diese Meditation helfen. \n\nFür diese Übung solltest du sitzen. Da diese Übung deine emotionale Intelligenz trainiert, bitte nimm im zweiten Teil den körperlichen Ausdruck deiner Gefühle besonders wahr.",
      icon: Icons.accessibility_new,
    ),
    Ubung(
      title: "Meditatives Zirkeltraining",
      bereich: "Entspannung, Achtsamkeit\n",
      wiederholungen: "Bei Anspannung\n",
      anwendungsgebiet: "Entspannung, Achtsamkeit",
      dauer: 20.0,
      erklarung:
          "Bist du aktuell gestresst? Diese Übung kann dir dabei helfen, dich zu entspannen.",
      einleitung:
          "\nBevor wir starten, nimm bitte eine bequeme Sitzposition ein, in der du entspannt und aufmerksam zugleich sein kannst. Wie diese Position aussieht, entscheidest du.",
      icon: Icons.trip_origin,
    ),
    Ubung(
      title: "3 Minuten Taucher",
      bereich: "Achtsamkeit\n",
      wiederholungen: "2-3x täglich\n",
      anwendungsgebiet: "Achtsamkeit, Entspannung, Fokus, positives Denken",
      dauer: 5.0,
      erklarung: "Positive Gedanken gefällig? Oft kommt das positive Denken in unserem Alltag zu kurz, obwohl es so wichtig ist. Mit dieser Übung möchten wir dir dabei helfen, mehr positives Denken in deinen Alltag zu integrieren.",
      einleitung: "\nSolltest du aktuell gestresst sein, oder positive Gedanken benötigen, hilft dir der 3 Minuten Taucher enorm weiter (auch, wenn er ca. 5 Minuten dauert). Für diese Übung solltest du eine bequeme Sitzposition einnehmen.",
      icon: Icons.timer,
    ),
    Ubung(
      title: "coming soon...",
      bereich: "coming soon...\n",
      wiederholungen: "coming soon...\n",
      anwendungsgebiet: "coming soon...",
      dauer: 0.0,
      erklarung: "coming soon...",
      einleitung: "\ncoming soon...",
      icon: Icons.insert_invitation,
    ),
  ];
}
