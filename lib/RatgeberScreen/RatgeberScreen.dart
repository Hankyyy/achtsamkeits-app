import 'package:flutter/material.dart';

class RatgeberScreen extends StatefulWidget {
  @override
  _RatgeberScreenState createState() => _RatgeberScreenState();
}

class _RatgeberScreenState extends State<RatgeberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ratgeber',
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
          color: Theme.of(context).textTheme.title.color,
          tooltip: "Zurück",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.5),
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Prüfungsangst",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Ich habe Angst vor der anstehenden Prüfung, was soll ich tun?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                          "Vor einer Prüfung nervös zu sein ist ganz normal. Gegen die Nervosität hilft nur Lernen,"
                          " denn wer gut vorbereitet ist, der kann viel gelassener in die Prüfung gehen."
                          " Dabei kannst du verschiedene Dinge lernen: WIE, WANN und WAS du am Besten lernst."
                          " Helfen können dir dabei verschiedene Workshops an der Hochschule,"
                          " Altklausuren und Tipps von deiner Fachschaft oder der APE - sowohl zum Entspannen,"
                          " als auch zum Organisieren.Problematisch wird es aber, wenn die Angst dich so vereinnahmt,"
                          " dass du starke psychische oder sogar physische Auswirkungen zu spüren bekommst."
                          " Doch auch diese starke Form der Prüfungsangst kann man besiegen. Hier gibt es entweder Workshops,"
                          " in Gruppen oder Einzelgespräche bei der psychosozialen Beratung des Studierendenwerkes.",
                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                    /*ExpansionTile(
                      title: Text("Workshops"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Fachschaft Altklausuren"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Tutoren"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Prüfung Abmelden"),
                      children: <Widget>[],
                    ),*/
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Zweifel am Studium",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Habe ich die richtige Wahl getroffen?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(15),
                    child: Text("Vielen Studenten geht es so: Sie fragen sich,"
                        " ob das gewählte Studium wirklich das Richtige für sie ist."
                        " Deshalb gibt es an jeder Hochschule eine Fachstudienberatung,"
                        " die dabei helfen kann, damit Interessen und Studienfach zusammenpassen."
                        " Oft werden auch Programme angeboten, die einen Wechsel in eine Ausbildung ermöglichen.",
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                    /*ExpansionTile(
                      title: Text("Fachstudienberatung"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Workshops"),
                      children: <Widget>[],
                    ),*/
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Überforderung",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "So viele Informationen - wie behalte ich den Überblick?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Volle Stundenpläne, viele Prüfungen, dazu Nebenjobs und Praktika: "
                            "Zwischen Hörsaal, Bibliothek und Nebenjob kämpfen Bachelor- und Masterstudenten "
                            "heute gegen Stress und Überforderung.Dagegen hilft ein gutes Zeitmanagement. "
                            "Setze dir im Uni-Alltag klare Prioritäten.Aber vergiss die Pausen nicht: Ruhephasen, "
                            "einen Spaziergang um den Block oder ein Treffen mit Freunden sollte man bewusst im Tagespensum "
                            "einplanen. Wer sich mit der Organisation des Studienalltags und dem Stress allein überfordert fühlt, "
                            "kann auf die Beratungsangebote an den Unis zurückgreifen.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Anschluss",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Wie kann ich neue Freunde finden?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                          "Du bist Ersti, Hochschulwechsler, vielleicht sogar extra umgezogen in eine neue Stadt,"
                          " nur um studieren zu können, und hast nun Angst, ob du Anschluss findest?"
                          " Da brauchst du dir absolut keine Sorgen machen, denn den anderen geht es ganz genauso wie dir!"
                          " Besuche die Ersti-Woche, absolviere alle nötigen Vorkurse und sei dabei bei allen Vorlesungen,"
                          " Übungen und Praktika und im Nu lernst du viele Leute kennen, die den gleichen Weg vor sich haben wie du."
                          " Auch außerhalb der Lehreinrichtungen kannst du beim (Hochschul-)Sport neue Freunde finden,"
                          " die zur Abwechslung vielleicht nicht das Gleiche studieren wie du.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                    /*ExpansionTile(
                      title: Text("Ersti-Woche"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Vorkurse"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Hochschulsport"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Vorlesung/Übung/Praktika"),
                      children: <Widget>[],
                    ),*/
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Prokrastination",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Hilfe, morgen ist schon die Prüfung!",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Du schiebst unangenehme Tätigkeiten lieber auf als sie sofort zu erledigen?"
                            " Ständiges Aufschieben wird von den Betroffenen und ihrer Umgebung oft für"
                            " persönliche Willensschwäche gehalten oder als Faulheit angesehen. "
                            "Prokrastination hat jedoch nichts mit Faulheit zu tun und mit solchen Konzepten lässt es sich auch nicht verändern. "
                            "Vielmehr handelt es sich dabei um ein ernsthaftes Problem der Selbststeuerung, für das es professionelle Hilfe gibt.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Termine Einhalten",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Wie merke ich mir wichtige Termine?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Dir fällt es schwer Termine einzuhalten? Dagegen hilft ein gutes Zeitmanagement. "
                            "Setze dir im Uni-Alltag klare Prioritäten. Ein Kalender und Erinnerungen "
                            "helfen dir enorm bei der Strukturierung deines Alltags.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Regelstudienzeit",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Wie lange ist zu lange?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Regelstudienzeit wird überbewertet. Sie ist nur eine Kennzahl, "
                            "die mit einem interessanten und wertvollen Studium herzlich wenig zu tun hat. "
                            "Die Folge davon ist, dass unsere Hochschulen Hochleistungsabsolventen erzeugen, "
                            "die auf dem Papier einen makellosen Studienverlauf vorweisen können. "
                            "Nur leider ohne interessante Zwischenstationen, ohne Zusatz-Know-How und ohne Ecken und Kanten. "
                            "Ein großer Einheitsbrei, ohne Individualität aber dafür immerhin langweilig. "
                            "Dabei gibt es viele Dinge, die wichtiger sind als die Einhaltung der Regelstudienzeit "
                            "und dir nachhaltig mehr Glück, Zufriedenheit und Erfolg im Leben bringen.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Langeweile neben dem Studium",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Was kann man außer Lernen noch so machen?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Du weißt nicht, was du mit deiner Freizeit anstellen sollst? Deine Hochschule bietet dir diverse Möglichkeiten diese zu füllen. "
                            "Wenn du der sportliche Typ bist, dann kannst du dich auf den Seiten des Hochschulsportes umsehen. "
                            "Du magst Politik? Zum Reinschnuppern bietet sich die Hochschulpolitik an, mit der du sogar tatsächlich Dinge "
                            "in deinem Hochschulalltag verändern kannst! Du magst Reisen und fremde Sprachen? Dann sind Sprachkurse "
                            "eine gute Vorbereitung für deinen nächsten Trip. Wenn du es lieber ruhiger magst oder nur eine Pause zwischen "
                            "den Vorlesungen füllen möchtest, dann ist die Bibliothek vielleicht der richtige Ort für dich.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Gute Noten",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Wie wichtig sind gute Noten und was bringen sie mir?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Um dein Studium erfolgreich abzuschließen, musst du die Prüfungen in erster Linie bestehen - "
                            "welche Note dabei herauskommt (oberhalb von 4,0) spielt dabei ersteinmal keine Rolle. "
                            "Trotzdem können gute Noten dir einige Vorteile verschaffen, wie beispielsweise Stipendien. "
                            "Auch für einige Master-Studiengänge gibt es NCs oder entsprechende Vorgaben in der Zulassungsordnung, "
                            "sodass du diese nur mit einem guten Notendurchschnitt beginnen darfst.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hilfe: IT",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Wende dich bei IT-Problemen an den für deinen Standort zuständigen Support.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Private Probleme",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Vielen Studierenden fällt es schwer, eine psychologische Beratung in Anspruch zu nehmen. "
                            "Vielleicht hilft es Ihnen, sich bewusst zu machen, dass Sie mit einer frühzeitigen "
                            "Unterstützung umso schneller wieder selbstständig voran kommen. Die PSB unterstützt "
                            "Studierende bei der Bewältigung persönlicher und studienbedingter Schwierigkeiten "
                            "oder bei der Vorbereitung auf herausfordernde Studien- und Lebensphasen. Ziel der Beratung ist, "
                            "Ihre Fähigkeiten zur Veränderung Ihrer Situation zu aktivieren und Sie zu unterstützen, "
                            "die Krisensituationen selbständig zu meistern. Die Beratungen sind kostenfrei und absolut vertraulich.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Meine Frage war nicht dabei!",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Die Tipps haben dir nicht weitergeholfen? Dann wende dich - je nach Problem - "
                            "an Professoren, Mitarbeiter, Fachschaftsrat, AStA, Prüfungsamt oder Studienberatung. "
                            "Wenn du unsicher bist, an wen du dich wenden sollst, frag am besten einfach bei deinem Fachschaftsrat nach.",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
