class Ubung {
  final String title;
  String quickTitle;
  String bereich;
  String wiederholungen;
  String anwendungsgebiet;
  int dauer;
  String erklarung;
  String einleitung;

  var icon;

  Ubung(
      {this.title,
      this.quickTitle,
      this.bereich,
      this.wiederholungen,
      this.anwendungsgebiet,
      this.dauer,
      this.erklarung,
      this.einleitung,
      this.icon})
      : assert(title != null);
}
