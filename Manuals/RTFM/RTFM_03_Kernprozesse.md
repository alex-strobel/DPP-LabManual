# Richtlinien für Transparenz im Forschungsdaten-Management

> „Die langfristige Sicherung und Bereitstellung der Forschungsdaten leistet einen Beitrag zur Nachvollziehbarkeit und Qualität der wissenschaftlichen Arbeit und eröffnet wichtige Anschlussmöglichkeiten für die weitere Forschung.“<br> 
aus den [DFG-Leitlinien zum Umgang mit Forschungsdaten](https://www.dfg.de/download/pdf/foerderung/grundlagen_dfg_foerderung/forschungsdaten/leitlinien_forschungsdaten.pdf)

---

## FDM-Kernprozesse

### Definition Kernprozesse 

+ Maßnahmen, die von den Leitlinien der TUD und DFG gefordert werden.

### Grundlagen

+ [DFG-Leitlinien zum Umgang mit Forschungsdaten](https://www.dfg.de/download/pdf/foerderung/grundlagen_dfg_foerderung/forschungsdaten/leitlinien_forschungsdaten.pdf)
+ [DGPs-Empfehlungen zum Umgang mit Forschungsdaten im Fach Psychologie](https://econtent.hogrefe.com/doi/10.1026/0033-3042/a000341)<!-- Einarbeitung relevanter Punkte erfolgt durch Team Forschungsdaten der Fakultät Psychologie) -->
+ [Satzung zur Sicherung guter wissenschaftlicher Praxis](https://tu-dresden.de/tu-dresden/qualitaetsmanagement/ressourcen/dateien/Amtliche-Bekanntmachung.pdf?lang=de) der TU Dresden<br>
+ [Leitlinien für den Umgang mit Forschungsdaten an der TU Dresden](https://tu-dresden.de/tu-dresden/qualitaetsmanagement/ressourcen/dateien/wisprax/Leitlinien-fuer-den-Umgang-mit-Forschungsdaten-an-der-TU-Dresden.pdf)<br>
Paragraphen mit Bezug zum Forschungsdatenmanagement:<br>
§ 7 Phasenübergreifende Qualitätssicherung im Forschungsprozess<br>
§ 8 Wissenschaftliche Veröffentlichungen

### Datenmanagementplan

#### Grundlage

+ DFG-Leitlinie 1: „Projektplanung und Antragstellung „In einem Antrag sollten die Antragstellenden daher ausführen, welche Forschungsdaten im Verlauf eines wissenschaftlichen Forschungsvorhabens entstehen, erzeugt oder ausgewertet werden […] Die einschlägigen Erläuterungen müssen Informationen zu Datentypen, falls vorhanden zu disziplinspezifischen Standards und zur Wahl geeigneter Repositorien enthalten […]. Zusätzlich werden Angaben zu ggf. betroffenen Rechten Dritter sowie erste Planungen zum zeitlichen Rahmen der Datenveröffentlichung erbeten.“
+ TUD-Leitlinie 3: „Für Projekte mit Forschungsdaten soll, basierend auf allgemeinen und fachspezifischen Richtlinien (z.B. der Fördermittelgeber oder Fachgesellschaften), möglichst schon bei Projektkonzeption bzw. -antragstellung ein „Data Management Plan“ erstellt werden, der den Umgang mit Forschungsdaten dokumentiert.“

#### Umsetzung

+ vgl. [Checkliste/Formular des Datenmanagementplan (DMP) Service der Kontaktstelle Forschungsdaten](https://tu-dresden.de/forschung-transfer/services-fuer-forschende/kontaktstelle-forschungsdaten/unser-service/dm-texte/formular)  

### Datendokumentation

#### Grundlage

+ TUD-Leitlinie 7: „Für die Bereitstellung und Nachnutzung ist es notwendig, die Daten, ihren Entstehungskontext und die benutzten Werkzeuge zu dokumentieren.“
+ TUD-Satzung § 7 (3) „Grundsätzlich sind alle für das Zustandekommen von Forschungsergebnissen relevanten Informationen zu dokumentieren. Dazu gehört auch, soweit dies möglich und zumutbar ist, die den Ergebnissen zugrundeliegenden Forschungsdaten.“


#### Umsetzung

+ Nachvollziehbare Dokumentation ist eine Voraussetzung für die Nachnutzung von Daten 
+ Der Umfang der Dokumentation richtet sich nach der Zielgruppe: Dokumentationen werden nicht für fachfremdes Personal geschrieben, sondern für Kolleg:innen mit ähnlichem Ausbildungsniveau
+ Im Idealfall befindet sich in jedem Ordner eine kurze Text-Datei (Readme.txt), die den Inhalt des Ordners beschreibt (auch als „Leseanleitungen“ oder „Ordner-Steckbrief“ bezeichnet)
+ Allgemeine Dokumentationen sollten an zentraler Stelle (z.B. oberste Hierarchie-Ebene auf dem Gruppenlaufwerk) abgelegt werden; sämtliche Dokumente sollten eindeutig benannt werden; bei vielen Dokumenten kann es sich lohnen, eine Übersicht (z.B. Excel) zu führen (Liste aktuell halten -> verantwortliche Person bestimmen) 
  + Code-Books: Erklärungen zur Bedeutung verwendeter Variablen und Abkürzungen <!-- Eine mögliche Vorlage für ein „Code-Book“ bei der Professur „Abhängiges Verhalten“ --> 
  + Manuale: detaillierte Beschreibung von Forschungsabläufen 
  + Versionskontrolle: Modifikationen an Dateien werden durch Dokumentation, z.B. in einer Word-Datei, erfasst; Ziel ist die Nachvollziehbarkeit, die „Data Lineage“ <!-- Beispiel eines solchen Dokuments sind die Readme-Dokumente der der Professur „Arbeitspsychologie“ -->
  + Skripte (Python, R-Code, Matlab, etc.): relevante Informationen in Header und In-line Kommentare dokumentieren 
+ Weiterführende Links <!-- Beispiel eines auskommentiertes R-Skripts bei der Professur „Kognitive Modellierung“ -->
  + [Vorlage Readme.txt](#readme.txt) (s.a. den [Guide to writing "readme" style metadata](https://data.research.cornell.edu/content/readme))
  + [Vorlage Code Book](#vorlage-code-book)

### Datenarchivierung

#### Grundlage

+ Einrichtung oder in einer fachlich einschlägigen, überregionalen Infrastruktur für mindestens 10 Jahre archiviert werden.“

+ TUD-Leitlinie 8: „Forschungsdaten, die Grundlage einer Publikation bilden, sollen langfristig in einem geeigneten vertrauenswürdigen Datenarchiv bzw. Repositorium archiviert und/oder geeignet veröffentlicht werden. Sie sind Teil der wissenschaftlichen Reputation der Forschenden.“

+ TUD Satzung GWP: § 7 (4) „Primärdaten als Grundlagen für Veröffentlichungen sind auf haltbaren und gesicherten Trägern in der Einrichtung, in der sie entstanden sind, aufzubewahren.“

+ TUD Satzung GWP: §7 (5) „In der Regel müssen die Primärdaten für zehn Jahre in der Einrichtung zugänglich bleiben. [...] In der Regel verbleiben die Originaldaten und -unterlagen am Entstehungsort; es können aber Duplikate angefertigt oder Zugangsrechte bestimmt werden. (6) Sind in den Primärdaten personenbeziehbare Daten enthalten – Einzelangaben über persönliche oder sachliche Verhältnisse einer bestimmten oder bestimmbaren natürlichen Person – so sind die Merkmale, mit deren Hilfe ein Personenbezug hergestellt werden kann, getrennt zu speichern; die Merkmale sind zu löschen, sobald der Forschungszweck dies zulässt. Insofern sind diese Daten aus den zu archivierenden Primärdaten zu entfernen. (8) Aus Gründen der Nachvollziehbarkeit, Anschlussfähigkeit der Forschung und Nachnutzbarkeit hinterlegen Wissenschaftler und Wissenschaftlerinnen, wenn immer möglich, die der Publikation zugrundeliegenden Forschungsdaten und zentralen Materialien – den FAIR-Prinzipien („Findable, Accessible, Interoperable, ReUsable“) folgend – zugänglich in anerkannten Archiven und Repositorien.“ 

+ TUD-Leitlinie 5: „Die TU Dresden verfügt über eine Grundausstattung an Forschungsdateninfrastruktur und stellt damit eine angemessene Aufbewahrung und die technische Verfügbarkeit von digitalen Forschungsdaten sicher“

#### Umsetzung

+	Zeitpunkt für Archivierung von Forschungsdaten: 
  + nach Projektabschluss bzw. zusammen mit der Veröffentlichung der Forschungsergebnisse
  + in beiden Fällen werden die Daten i.d.R. nicht mehr verändert
+	Vorgehen bei der Datenarchivierung: 
  + Datenselektion: Guidelines for appraising and selecting research data
  + Datenaufbereitung (analog zur „Checkliste für die Ablage von Daten auf dem Gruppenlaufwerk“ in Abschnitt 3 „Datenorganisation“); bei personenbezogenen Daten zusätzlich Anonymisierung oder Pseudonymisierung der Forschungsdaten; Unterstützung bietet die [Unabhängige Treuhandstelle der TU Dresden](https://tu-dresden.de/med/mf/forschung/services-fuer-forschende/unabhaengige-treuhandstelle)  (aktuell im Aufbau ist auch die neue Datentreuhandstelle der TU Dresden: „DD Trust“)
  + Verwendung geeigneter Dateiformate: im Falle von proprietären Dateiformaten sollten die Originaldaten zusätzlich in ein offenes Dateiformat exportiert und zusammen archiviert werden (z.B. \*.xlsx + \*.csv)
  + Auswahl einer geeigneten Archivlösung, z.B. [Archivierung am ZIH](https://tu-dresden.de/zih/dienste/service-katalog/arbeitsumgebung/backup_archiv/archivierung_am_zih) der TU Dresden (OpARA oder Zwischenarchiv)

### Datenpublikation 

#### Grundlage

+ DFG-Leitlinie 2: „Bereitstellung „Soweit einer Veröffentlichung der Forschungsdaten aus einem DFG-geförderten Projekt Rechte Dritter (insbesondere Datenschutz, Urheberrecht) nicht entgegenstehen, sollten Forschungsdaten so zeitnah wie möglich verfügbar gemacht werden.“

+ Leitlinie 6: „Die TU Dresden fördert und unterstützt den freien Zugang zu Forschungsdaten (Open Access) – einerseits im Sinne guter wissenschaftlicher Praxis, andererseits wegen der großen Bedeutung für die optimale Verwertung von Forschungsergebnissen und der Qualität der Forschung. Die Entscheidung für eine Veröffentlichung und deren rechtliche Bedingungen liegt in der Eigenverantwortung der Wissenschaftlerinnen und Wissenschaftler. Der Schutz persönlicher Daten, ethische und urheberrechtliche Belange, Verpflichtungen gegenüber Dritten und Verwertungsinteressen sollen ausgewogen berücksichtigt werden.“

+ TUD-Leitlinie 5: „Die TU Dresden verfügt über eine Grundausstattung an Forschungsdateninfrastruktur und stellt damit eine angemessene Aufbewahrung und die technische Verfügbarkeit von digitalen Forschungsdaten sicher“

#### Umsetzung

+ Zeitpunkt für die Veröffentlichung von Forschungsdaten:
  + zu jeder Publikation werden die relevanten Forschungsdaten veröffentlicht 
+ Vorgehen bei der Datenpublikation: 
  + Datenselektion und Datenaufbereitung erfolgt analog zum Vorgehen im Abschnitt „Datenarchivierung“
  + Lizenzen: bei Verwendung Daten dritter sollten die Daten nur nach Rücksprache mit den Dateneigentümern und unter Verwendung einer geeigneten Lizenz veröffentlicht werden (vgl. Abschnitt „Datenschutz“ weiter unten)
  + Auswahl eines geeigneten Datenrepositoriums
    + Verzeichnis von Forschungsdatenrepositorien: [re3data](https://www.re3data.org/)
    + Datenrepositorium der TU Dresden: [OpARA](https://opara.zih.tu-dresden.de/)
    + Datenrepositorien mit Fokus Psychologie: ... <!-- Link ergänzen Team Forschungsdaten, z.B. OSF, GitHub, Leibniz Psychology -->

### Datenschutz

#### Grundlage

+ TUD-Leitlinie 6: "Die TU Dresden fördert und unterstützt den freien Zugang zu Forschungsdaten (Open Access) – einerseits im Sinne guter wissenschaftlicher Praxis, andererseits wegen der großen Bedeutung für die optimale Verwertung von Forschungsergebnissen und der Qualität der Forschung. Die Entscheidung für eine Veröffentlichung und deren rechtliche Bedingungen liegt in der Eigenverantwortung der Wissenschaftlerinnen und Wissenschaftler. Der Schutz persönlicher Daten, ethische und urheberrechtliche Belange, Verpflichtungen gegenüber Dritten und Verwertungsinteressen sollen ausgewogen berücksichtigt werden.""
+ TUD Satzung GWP: §7 (6): "Sind in den Primärdaten personenbeziehbare Daten enthalten - Einzelangaben über persönliche oder sachliche Verhältnisse einer bestimmten oder bestimmbaren natürlichen Person – so sind die Merkmale, mit deren Hilfe ein Personenbezug hergestellt werden kann, getrennt zu speichern; die Merkmale sind zu löschen, sobald der Forschungszweck dies zulässt. Insofern sind diese Daten aus den zu archivierenden Primärdaten zu entfernen."
+ TUD Satzung GWP: § 8 (10): "Soll die Veröffentlichung personenbeziehbare Daten enthalten – Einzelangaben über persönliche oder sachliche Verhältnisse einer bestimmten oder bestimmbaren natürlichen Person – so ist dies nur zulässig, wenn die hiervon Betroffenen eingewilligt haben oder dies für die Darstellung von Forschungsergebnissen über Ereignisse der Zeitgeschichte unerlässlich ist und überwiegende schutzwürdige Interessen der Betroffenen nicht entgegenstehen."

#### Umsetzung

+ Lizenzen für die Veröffentlichung von Forschungsdaten:
  + Die meisten Forschungsdaten werden unter Verwendung einer [Creative Commons Lizenz](https://www.bertelsmann-stiftung.de/fileadmin/files/BSt/Publikationen/Infomaterialien/IN_Freie_Lizenzen_-_einfach_erklaert_Poster_2017_07_20.pdf) veröffentlicht
  + Im Zweifelsfall: Rücksprache mit der [Professur für Urheberrecht und geistiges Eigentum](https://tu-dresden.de/gsw/phil/irget/jfbimd13/die-professur) der TU Dresden
+ Datennutzungsverträgen
  + Die Überlassung von Forschungsdaten an Dritte sollte durch einen Datennutzungsvertrag abgesichert werden
  + Der [Datenschutzbeauftragte der TU-Dresden](https://tu-dresden.de/tu-dresden/organisation/gremien-und-beauftragte/beauftragte/datenschutzbeauftragter) unterstützt bei der Ausarbeitung von Datennutzungsverträgen
+ Technische Möglichkeiten für die sichere Übermittlung sensibler Forschungsdaten an externe Partner: 
  + Übermittlung per verschlüsselter E-Mail: der [Secure Mail-Dienst des ZIH](https://tu-dresden.de/tu-dresden/organisation/zentrale-universitaetsverwaltung/dezernat-3-zentrale-angelegenheiten/sg-3-5-informationssicherheit/securemail) kann verwendet werden, wenn die Datenmenge nicht zu groß ist
  + Übermittlung via Gruppenlaufwerk: dies setzt die Einrichtung eines [Gruppenlaufwerkes](https://tu-dresden.de/zih/dienste/service-katalog/arbeitsumgebung/datenspeicher/details) über das [Self Service Portal](https://selfservice.zih.tu-dresden.de/l/index.php/spor/request-form/) der TU Dresden voraus; für die Kooperationspartner müssen Gast-Logins beantragt und das Gruppenlaufwerk mit entsprechenden Berechtigungen versehen werden; sensible Daten müssen mit [Boxcryptor](https://tu-dresden.de/tu-dresden/organisation/zentrale-universitaetsverwaltung/dezernat-3-zentrale-angelegenheiten/sg-3-5-informationssicherheit/tud-cert/dateiverschluesselung-boxcryptor) verschlüsselt werden; zum Abruf müssen die externen Partner eine [VPN-Verbindung](https://tu-dresden.de/zih/dienste/service-katalog/arbeitsumgebung/zugang_datennetz/vpn) in das Netzwerk der TU Dresden aufbauen 
  + Übermittlung via [Cloudstore](https://tu-dresden.de/zih/dienste/service-katalog/zusammenarbeiten-und-forschen/datenaustausch/cloudstore)-Ordner: auch hier müssen sensible Daten mittels Boxcryptor verschlüsselt werden
+ Zur Qualitätssicherung kann es sinnvoll sein, eine Liste (z.B. Excel) zu führen, in der die eigenen Datenlieferungen protokolliert werden: welche Daten wurden wann an welchen Partner weitergeleitet?

---

[**Inhaltsverzeichnis**](RTFM_00_Inhalt.md) | [zurück zu **Zweck der Richtlinien**](RTFM_02_Zweck.md) | [weiter zu **Unterstützende Prozesse**](RTFM_04_Supportprozesse.md)