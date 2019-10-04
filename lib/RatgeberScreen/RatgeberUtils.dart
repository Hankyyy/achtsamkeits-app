class Ratgeber {
  String titel;
  String inhalt;
  String unterTitel;

  Ratgeber({this.titel, this.unterTitel, this.inhalt});
}

List<Ratgeber> ratgeberList() {
  return [
    Ratgeber(
      titel: "Prüfungsangst",
      unterTitel: "Ich habe Angst vor der anstehenden Prüfung, was soll ich tun?",
      inhalt: "Vor einer Prüfung nervös zu sein ist ganz normal. Gegen die Nervosität hilft nur Lernen,"
          " denn wer gut vorbereitet ist, der kann viel gelassener in die Prüfung gehen."
          " Dabei kannst du verschiedene Dinge lernen: WIE, WANN und WAS du am Besten lernst."
          " Helfen können dir dabei verschiedene Workshops an der Hochschule,"
          " Altklausuren und Tipps von deiner Fachschaft oder der APE - sowohl zum Entspannen,"
          " als auch zum Organisieren.Problematisch wird es aber, wenn die Angst dich so vereinnahmt,"
          " dass du starke psychische oder sogar physische Auswirkungen zu spüren bekommst."
          " Doch auch diese starke Form der Prüfungsangst kann man besiegen. Hier gibt es entweder Workshops,"
          " in Gruppen oder Einzelgespräche bei der psychosozialen Beratung des Studierendenwerkes.",
    ),
    Ratgeber(
      titel: "Zweifel am Studium",
      unterTitel: "Habe ich die richtige Wahl getroffen?",
      inhalt: "Vielen Studenten geht es so: Sie fragen sich,"
          " ob das gewählte Studium wirklich das Richtige für sie ist."
          " Deshalb gibt es an jeder Hochschule eine Fachstudienberatung,"
          " die dabei helfen kann, damit Interessen und Studienfach zusammenpassen."
          " Oft werden auch Programme angeboten, die einen Wechsel in eine Ausbildung ermöglichen.",
    ),
    Ratgeber(
      titel: "Überforderung",
      unterTitel: "So viele Informationen - wie behalte ich den Überblick?",
      inhalt: "Volle Stundenpläne, viele Prüfungen, dazu Nebenjobs und Praktika: "
          "Zwischen Hörsaal, Bibliothek und Nebenjob kämpfen Bachelor- und Masterstudenten "
          "heute gegen Stress und Überforderung.Dagegen hilft ein gutes Zeitmanagement. "
          "Setze dir im Uni-Alltag klare Prioritäten.Aber vergiss die Pausen nicht: Ruhephasen, "
          "einen Spaziergang um den Block oder ein Treffen mit Freunden sollte man bewusst im Tagespensum "
          "einplanen. Wer sich mit der Organisation des Studienalltags und dem Stress allein überfordert fühlt, "
          "kann auf die Beratungsangebote an den Unis zurückgreifen.",
    ),
    Ratgeber(
      titel: "Anschluss",
      unterTitel: "Wie kann ich neue Freunde finden?",
      inhalt: "Du bist Ersti, Hochschulwechsler, vielleicht sogar extra umgezogen in eine neue Stadt,"
          " nur um studieren zu können, und hast nun Angst, ob du Anschluss findest?"
          " Da brauchst du dir absolut keine Sorgen machen, denn den anderen geht es ganz genauso wie dir!"
          " Besuche die Ersti-Woche, absolviere alle nötigen Vorkurse und sei dabei bei allen Vorlesungen,"
          " Übungen und Praktika und im Nu lernst du viele Leute kennen, die den gleichen Weg vor sich haben wie du."
          " Auch außerhalb der Lehreinrichtungen kannst du beim (Hochschul-)Sport neue Freunde finden,"
          " die zur Abwechslung vielleicht nicht das Gleiche studieren wie du.",
    ),
    Ratgeber(
      titel: "Prokrastination",
      unterTitel: "Hilfe, morgen ist schon die Prüfung!",
      inhalt: "Du schiebst unangenehme Tätigkeiten lieber auf als sie sofort zu erledigen?"
          " Ständiges Aufschieben wird von den Betroffenen und ihrer Umgebung oft für"
          " persönliche Willensschwäche gehalten oder als Faulheit angesehen. "
          "Prokrastination hat jedoch nichts mit Faulheit zu tun und mit solchen Konzepten lässt es sich auch nicht verändern. "
          "Vielmehr handelt es sich dabei um ein ernsthaftes Problem der Selbststeuerung, für das es professionelle Hilfe gibt.",
    ),
    Ratgeber(
      titel: "Termine Einhalten",
      unterTitel: "Wie merke ich mir wichtige Termine?",
      inhalt: "Dir fällt es schwer Termine einzuhalten? Dagegen hilft ein gutes Zeitmanagement. "
          "Setze dir im Uni-Alltag klare Prioritäten. Ein Kalender und Erinnerungen "
          "helfen dir enorm bei der Strukturierung deines Alltags.",
    ),
    Ratgeber(
      titel: "Regelstudienzeit",
      unterTitel: "Wie lange ist zu lange?",
      inhalt: "Regelstudienzeit wird überbewertet. Sie ist nur eine Kennzahl, "
          "die mit einem interessanten und wertvollen Studium herzlich wenig zu tun hat. "
          "Die Folge davon ist, dass unsere Hochschulen Hochleistungsabsolventen erzeugen, "
          "die auf dem Papier einen makellosen Studienverlauf vorweisen können. "
          "Nur leider ohne interessante Zwischenstationen, ohne Zusatz-Know-How und ohne Ecken und Kanten. "
          "Ein großer Einheitsbrei, ohne Individualität aber dafür immerhin langweilig. "
          "Dabei gibt es viele Dinge, die wichtiger sind als die Einhaltung der Regelstudienzeit "
          "und dir nachhaltig mehr Glück, Zufriedenheit und Erfolg im Leben bringen.",
    ),
    Ratgeber(
      titel: "Langeweile neben dem Studium",
      unterTitel: "Was kann man außer Lernen noch so machen?",
      inhalt: "Du weißt nicht, was du mit deiner Freizeit anstellen sollst? Deine Hochschule bietet dir diverse Möglichkeiten diese zu füllen. "
          "Wenn du der sportliche Typ bist, dann kannst du dich auf den Seiten des Hochschulsportes umsehen. "
          "Du magst Politik? Zum Reinschnuppern bietet sich die Hochschulpolitik an, mit der du sogar tatsächlich Dinge "
          "in deinem Hochschulalltag verändern kannst! Du magst Reisen und fremde Sprachen? Dann sind Sprachkurse "
          "eine gute Vorbereitung für deinen nächsten Trip. Wenn du es lieber ruhiger magst oder nur eine Pause zwischen "
          "den Vorlesungen füllen möchtest, dann ist die Bibliothek vielleicht der richtige Ort für dich.",
    ),
    Ratgeber(
      titel: "Gute Noten",
      unterTitel: "Wie wichtig sind gute Noten und was bringen sie mir?",
      inhalt: "Um dein Studium erfolgreich abzuschließen, musst du die Prüfungen in erster Linie bestehen - "
          "welche Note dabei herauskommt (oberhalb von 4,0) spielt dabei ersteinmal keine Rolle. "
          "Trotzdem können gute Noten dir einige Vorteile verschaffen, wie beispielsweise Stipendien. "
          "Auch für einige Master-Studiengänge gibt es NCs oder entsprechende Vorgaben in der Zulassungsordnung, "
          "sodass du diese nur mit einem guten Notendurchschnitt beginnen darfst.",
    ),
    Ratgeber(
      titel: "Hilfe: IT",
      unterTitel: "",
      inhalt: "Wende dich bei IT-Problemen an den für deinen Standort zuständigen Support.",
    ),
    Ratgeber(
      titel: "Private Probleme",
      unterTitel: "",
      inhalt: "Vielen Studierenden fällt es schwer, eine psychologische Beratung in Anspruch zu nehmen. "
          "Vielleicht hilft es Ihnen, sich bewusst zu machen, dass Sie mit einer frühzeitigen "
          "Unterstützung umso schneller wieder selbstständig voran kommen. Die PSB unterstützt "
          "Studierende bei der Bewältigung persönlicher und studienbedingter Schwierigkeiten "
          "oder bei der Vorbereitung auf herausfordernde Studien- und Lebensphasen. Ziel der Beratung ist, "
          "Ihre Fähigkeiten zur Veränderung Ihrer Situation zu aktivieren und Sie zu unterstützen, "
          "die Krisensituationen selbständig zu meistern. Die Beratungen sind kostenfrei und absolut vertraulich.",
    ),
    Ratgeber(
      titel: "Meine Frage war nicht dabei!",
      unterTitel: "",
      inhalt: "Die Tipps haben dir nicht weitergeholfen? Dann wende dich - je nach Problem - "
          "an Professoren, Mitarbeiter, Fachschaftsrat, AStA, Prüfungsamt oder Studienberatung. "
          "Wenn du unsicher bist, an wen du dich wenden sollst, frag am besten einfach bei deinem Fachschaftsrat nach.",
    ),
  ];
}