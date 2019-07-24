class Ubung {
  final String title;
  String bereich;
  String wiederholungen;
  String anwendungsgebiet;
  double dauer;
  String erklarung;
  String einleitung;

  var icon;

  Ubung(
      {this.title,
      this.bereich,
      this.wiederholungen,
      this.anwendungsgebiet,
      this.dauer,
      this.erklarung,
      this.einleitung,
      this.icon}) : assert(title != null);
}
