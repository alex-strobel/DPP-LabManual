# Richtlinien für Transparenz im Forschungsdaten-Management

> „Die langfristige Sicherung und Bereitstellung der Forschungsdaten leistet einen Beitrag zur Nachvollziehbarkeit und Qualität der wissenschaftlichen Arbeit und eröffnet wichtige Anschlussmöglichkeiten für die weitere Forschung.“<br> 
aus den [DFG-Leitlinien zum Umgang mit Forschungsdaten](https://www.dfg.de/download/pdf/foerderung/grundlagen_dfg_foerderung/forschungsdaten/leitlinien_forschungsdaten.pdf)

---

## Unterstützende Prozesse für das FDM

#### Definition

+ unterstützende Prozesse ermöglichen die Umsetzung der Kernprozesse 

### Datenorganisation

#### Grundlage

+ TUD-Leitlinie 5: „Die TU Dresden verfügt über eine Grundausstattung an Forschungsdateninfrastruktur und stellt damit eine angemessene Aufbewahrung und die technische Verfügbarkeit von digitalen Forschungsdaten sicher“


#### Umsetzung

+ Datenablage  <!-- ergänzen durch Team Forschungsdaten -->
  + Zum Einsatz kommen ZIH-Dienste wie Gruppenlaufwerke oder SharePoint
  + Für bestimmte Anwendungsfälle kommt REDCap zum Einsatz 
+ Gruppenlaufwerke/Ordnerstrukturen
  + Für jedes Gruppenlaufwerk sollte eine Ansprechperson benannt werden und allen Mitarbeitenden bekannt sein; die Ansprechperson steht für Nachfragen zur Verfügung („Wo legt man diese und jene Datei ab?“), die Ansprechperson führt aber auch regelmäßig Qualitätskontrollen auf dem Gruppenlaufwerk durch 
  + Grundlegende Vorschläge für die Ordnerstruktur:
    + Berufliche Daten von privaten Daten trennen
    + Berufliche Daten aufteilen in Forschungsdaten und administrativen Daten 
    + Forschungsdaten aufteilen in Rohdaten, verarbeitete Daten, finale Daten  
  + Weiterführende Links
    + Link zur Vorlage einer Referenzprojekt-Ordnerstruktur inkl. Readme.txt-Vorlage <!-- Folgende Professuren verwenden Ordnerstrukturen, die als Vorlage dienen könnten: „Behaviorale Psychotherapie“ und „Differentielle Psychologie“ -->
    + ggf. [BIDS](https://www.nature.com/articles/sdata201644)-Dateiablagesystem erwähnen

>***Beispiel einer Checkliste für Datenpflege auf dem Gruppenlaufwerk***
><!-- Mögliche Regelung: jede Forschungsgruppe soll auf Basis dieses Beispiels eine Checkliste ausarbeiten, im Gruppenlaufwerk ablegen, regelmäßig aufdatieren und anwenden -->
>*Datentransfer*
>+ nur relevante Daten auf Gruppenlaufwerk ablegen <!-- Definition von „relevant“ ergänzen; im Zweifelsfall: Absprache im jeweiligen Team -->
>+ Datei an korrekter Stelle einfügen [im Zweifel nachfragen bei…]
>+ Eindeutig als zusammengehörig erkennbare Pakete aus Daten und Dokumentation schnüren
>
>*Datenqualität*
>+ Datenintegrität prüfen (Dateien nicht korrupt, d.h. lassen sich öffnen)
>+ Verifizierung der verwendeten Maßeinheiten/Abkürzungen gemäß Code-Book 
>
>*Dokumentation*
>+ Ordner/Dateien gemäß Dateinamenskonvention benennen
>+ Codierungen aus Dateinamen und Spaltenköpfen im Code-Book hinterlegen
>+ Code-Book auf Aktualität und Vollständigkeit prüfen
>+ Readme.txt anlegen bzw. aufdatieren
>+ Skripte auskommentieren
>+ Beschreibung des Prozessabläufe in Manualen anlegen bzw. auf Aktualität prüfen
>
>*Datenhygiene*
>+ 10 min pro Woche einplanen für „Datenhygiene“ auf dem Gruppenlaufwerk (z.B. gemeinsam im Team-Meeting)
>+ Fokus-Treffen, um gemeinsam Strukturen für Readme, Gruppenlaufwerke und weitere FDM-Regeln auszuarbeiten


### REDCap <!-- in Struktur einpflegen/ergänzen durch Team Forschungsdaten -->
<!-- Ob dieser Unterpunkt in die FDM-Leitlinie einfließen soll und in welchem Umfang ist noch offen; Professur „Differentielle Psychologie“ als Ansprechpartner für Umsetzung von Fragebögen und Schulung von Mitarbeitern bzgl. REDCap -->
+ Verwendungszweck: ergänzen durch Team Forschungsdaten, z.B. Erstellung, Durchführung und Auswertung von Umfragen
+ Datenqualität: semi-automatisierte Dokumentation der Arbeitsschritte durch User-Führung (z.B. automatische Erstellung von Logfiles und Code-Büchern)
+ Datenschutz: REDCap-Instanzen werden auf Servern des ZIH in Dresen ausgeführt; Kontaktdaten der Probanden werden in einer separaten Anwendung verwaltet (PAMS)
+ Weiterführende Links:
  + Links zu REDCap-Vorlagen
  + Links zu Manualen

### OSF
<!-- Ob dieser Unterpunkt in die FDM-Leitlinie einfließen soll und in welchem Umfang ist noch offen; David Riedel von der Kontaktstelle Forschungsdaten kann als Ansprechpartner dienen: aktuell läuft eine Studie zum Nutzerverhalte und deren Anforderungen an OSF 
 -->
+ Verwendungszweck: ergänzen durch Team Forschungsdaten, z.B. Präregistrierung
+ Datenqualität: es gelten die gleichen Anforderungen wie bei der Ablage von Daten auf dem Gruppenlaufwerl (analog zur „Checkliste für die Ablage von Daten auf dem Gruppenlaufwerk“ in Abschnitt 3 „Datenorganisation“);
+ Datenschutz: es können OSF-Server in Frankfurt/Main ausgewählt werden 
+ Weiterführende Links:
  + Beispiel für eine OSF-Struktur, mit der ein Institut seinen Forschungsalltag verwaltet: https://osf.io/n7263  
  + ggf. Link zu einem beispielhaften OSF-Projekt aus der Fakultät Psychologie

### Wissensmanagement Onboarding
+ Jede:r neue Mitarbeitende erhält diese FDM-Leitlinien zur Durchsicht (ggf. abzeichnen lassen?)<!--Beispiele für solche Dokumente finden sich bei den Professuren „Abhängiges Verhalten“ und „Arbeits- und Organisationspsychologie"-->
+ Die FDM-Leitlinien können durch eine individuelle Onboarding-Checkliste mit Informationen zur Arbeitsweise innerhalb einer Forschungsgruppe ergänzt werden 

>***Beispiel einer Onboarding-Checkliste*** 
><!--Mögliche Regelung: jede Forschungsgruppe soll auf Basis dieses Beispiels eine Checkliste ausarbeiten, im Gruppenlaufwerk ablegen, regelmäßig aufdatieren und anwenden-->
>+ wie werden Dateien benannt
>+ wo ist was auf dem Laufwerk zu finden/abzulegen
>+ wer in der Gruppe ist Ansprechpartner für welches Thema, welche Software, etc. 
>+ Hinweise zum Umgang mit Datenschutz
>+ Hinweise zur Verwertung der Daten nach Projekteende …

### Wissensmanagement Offboarding
+ Der Offboarding-Prozess umfasst die Bereinigung und Übergabe von Daten 
+ Dieser Prozess beginnt 3-6 Monate vor Austritt des Mitarbeitenden und kann unter Mitwirkung der [Kontaktstelle Forschungsdaten](https://tu-dresden.de/forschung-transfer/services-fuer-forschende/kontaktstelle-forschungsdaten) geplant und durchgeführt werden
+ Die Dokumente aus dem Offboarding sind u.a. Grundlage für das Onboarding des nachfolgenden Mitarbeitenden

>***Beispiel einer Offboarding-Checkliste***
><!-- Mögliche Regelung: jede Forschungsgruppe soll auf Basis dieses Beispiels eine Checkliste ausarbeiten, im Gruppenlaufwerk ablegen, regelmäßig aufdatieren und anwenden; Beispiel für ein solches Dokument findet sich bei der Professur „Arbeits- und Organisationspsychologie“ -->
>*Datenbereinigung*
>+ nicht mehr benötigte Dateien gelöscht oder archiviert
>+ aufzubewahrende Daten systematisch benannt und abgelegt
>
>*Datendokumentation*
>+ worum geht es bei diesem Datensatz/Ordner?
>+ was ist der der Ursprung dieser Daten/dieses Ordners?
>
>*Datenverwendung*
>+ für wen sind diese Daten interessant? 
>+ was hätten Sie gerne noch mit diesen Daten gemacht, wenn Sie ein weiteres ½ Jahr bleiben würden?
>+ die Daten sind auf folgende Art zu verwenden (Einsatzzweck/Methode/Software): …
>+ die Daten haben Abhängigkeiten/Schnittstellen zu …
>+ welche Probleme kennen Sie im Zusammenhang mit den Daten? wie sollte Ihr:e Nachfolger:in mit diesen Problemen >umgehen?
>+ für welchen Zweck dürfen die Daten unter keinen Umständen eingesetzt werden?
>+ welchen Einstieg würden sie derjenigen Person raten, die zukünftig mit diesen Daten arbeiten wird?
>
>*Soziales Netzwerk*
>+ wen haben Sie für Erstellung bzw. Verwendung der Daten häufig kontaktiert?
>+ wer hat Sie bzgl. der Verwendung der Daten häufig kontaktiert?
>+ wie kann Ihr Nachfolger Sie erreichen?

---

[**Inhaltsverzeichnis**](RTFM_00_Inhalt.md) | [zurück zu **Kernprozesse**](RTFM_03_Kernprozesse.md) | [weiter zu **Ressourcen und Vorlagen**](RTFM_05_Ressourcen.md)
