# Contributing Guidelines
bitte einmal komplett lesen :)

# Git 
- Download & Install git
- Erstelle eine account auf [github](https://github.com "github")

#### User Config
Run
```
git config --global user.name "Your Name"
git config --global user.email "your_email@whatever.com"
```

#### Clone Repository
```
git clone https://github.com/lhrb/swec8.git
```

### Wichtig niemals im master branch arbeiten!!!
Ein Merge in den Master Branch findet erst nach dem Code Review statt.

#### Erstelle einen Feature Branch

```
git checkout -b feature_name
```
Bitte den Präfix "feature" benutzen, name sollte aussagekräftig sein

#### Add
nach der Bearbeitung einer Datei kann man diese mittels
```
git add dateiname
```
dem Index hinzufügen.

#### Commit
Die Datei zum HEAD hinzufügen
```
git commit -m "commit message"
```
Commit mit Titel und Beschreibung
```
git commit -m "Titel" -m "Beschreibung"
```
#### Push
Die Dateien zum Repository senden
```
git push origin branch_name
```
branch_name ist der name eures feature branch ;)

#### Update
Euer Repo kann mittels
```
git pull
```
auf den neusten Stand gebracht werden d.h. alle branches werden gepulled.
Um den <b>master branch</b> auf den neuesten stand zu bringen
```
git pull origin master
```

#### Branching
In einen anderen Branch wechseln 
```
git checkout branchname
```
Branch löschen
```
git branch -d branchname 
```

#### Pull Konflikte
Es gibt 3 Möglochkeiten

Lokale änderungen verwerfen
```
git fetch --all 
git reset --hard origin/branch_name
```
Lokale änderungen, die bereits im HEAD sind, in einem branch speichern
```
git checkout master
git branch new-branch-to-save-current-commits
git fetch --all
git reset --hard origin/master
```
Uncommited Changes speichern
```
git stash
```

#### Zum weiterlesen
- (https://rogerdudler.github.io/git-guide/)
- (https://githowto.com/)
- (https://git-scm.com/doc)