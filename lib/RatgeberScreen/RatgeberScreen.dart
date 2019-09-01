import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';


class RatgeberScreen extends StatefulWidget {
  @override
  _RatgeberScreenState createState() => _RatgeberScreenState();
}

class _RatgeberScreenState extends State<RatgeberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ratgeber', style: TextStyle(fontSize: 30.0),),
        actions: <Widget>[

        ],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Ich habe Angst vor der anstehenden Prüfung, was soll ich tun? - Prüfungsangst',
    <Entry>[
      Entry(
        'Prüfung abmelden',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Workshops',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),

      Entry(
        'Fachschaft Altklausuren',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Tutoren',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Habe ich die richtige Wahl getroffen? - Zweifel am Studium',
    <Entry>[
      Entry(
        'Fachstudienberatung',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Workshops',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Wie kann ich neue Freunde finden? - Anschluss',
    <Entry>[
      Entry(
        'Ersti-Woche',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Vorkurs',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),

      Entry(
        'Hochschulsport',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Vorlesungen/Übungen/Praktika',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Hilfe, morgen ist schon die Prüfung! - Prokrastination',
    <Entry>[
      Entry(
        'Workshops',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Terminplanung/Lernplan',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),

      Entry(
        'diese App :)',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Wie merke ich mir wichtige Termine? - Termine einhalten',
    <Entry>[
      Entry(
        'sofort in Kalender eintragen',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Erinnerungen',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Wie lange ist zu lange? - Regelstudienzeit',
    <Entry>[
      Entry(
        'irgendeine Statistik zu Abschlüssen in Regelstudienzeit?',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'nicht ganz so wichtig',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),

      Entry(
        'lieber besser als schneller und auf eigenes Niveau anpassen',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Was kann man außer Lernen noch so machen? - Langeweile neben dem Studium',
    <Entry>[
      Entry(
        'Hochschulsport',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Hochschulpolitik',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),

      Entry(
        'Sprachkurse',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Bibliothek',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Wie wichtig sind gute Noten und was bringen sie mir? - Gute Noten',
    <Entry>[
      Entry(
        'Zulassungen Master',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Stipendien',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Hilfe: IT',
    <Entry>[
      Entry(
        'IT Help Desk',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Private Probleme',
    <Entry>[
      Entry(
        'Psychosoziale Studienberatung',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
  Entry(
    'Meine Frage war nicht dabei!',
    <Entry>[
      Entry(
        'Fachschaft/Asta',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Prof/Mitarbeiter',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),

      Entry(
        'Prüfungsamt',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
      Entry(
        'Studienberatung',
        <Entry>[
          Entry('Weiterer Text dazu hier..'),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}