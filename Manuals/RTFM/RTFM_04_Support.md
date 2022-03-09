# Richtlinien für Transparenz im Forschungsdaten-Management

> „Die langfristige Sicherung und Bereitstellung der Forschungsdaten leistet einen Beitrag zur Nachvollziehbarkeit und Qualität der wissenschaftlichen Arbeit und eröffnet wichtige Anschlussmöglichkeiten für die weitere Forschung.“<br> 
aus den [DFG-Leitlinien zum Umgang mit Forschungsdaten](https://www.dfg.de/download/pdf/foerderung/grundlagen_dfg_foerderung/forschungsdaten/leitlinien_forschungsdaten.pdf)

---

## Unterstützende Prozesse für das FDM

### Definition

+ unterstützende Prozesse ermöglichen die Umsetzung der Kernprozesse

### Überblick Unterstützende Prozesse

+ [Datenerhebung](#datenerhebung)
+ [Datenorganisation](#datenorganisation)
+ [Wissensmanagement Onboarding](#wissensmanagement-onboarding)
+ [Wissensmanagement Offboarding](#wissensmanagement-offboarding)

### Datenerhebung

+ **Versuchspersonenmanagement**: Ein effizientes Forschungsdatenmanagement setzt bereits in der Phase der Rekrutierung von Versuchspersonen an. Empfohlen wird dabei die Nutzung von [ORSEE/PaMS](RTFM_05_Tools.md#orseepams). <!-- @JS: bitte groben Ablauf der Koimmunikation von ORSEE und PaMS einfügen --> 
+ **Datenerhebung**: Die Erhebung von Forschungsdaten folgt i.A. spezifischen Voraussetzungen bzw. Erfordernissen der einzelnen Arbeitsgruppen der Fakultät. Typischerweise werden aber in jeden Projekt Selbst- und/oder Fremdauskünfte, experimentelle oder sonstige Verhaltensdaten sowie ggf. (in weitestem Sinne) physiologische Parameter mit Hilfe (peripher)physiologischer oder bildgebender Verfahren erhoben. Diese können z.B. via REDCap zusammengeführt werden. Der Vorteil der Nutzung von REDCap ist dabei u.a., dass REDCap direkt mit PaMS verschaltet ist bzw. verschaltet werden kann und somit personenbezogene Daten in PaMS gespeichert werden, während in REDCap nur die eigentlich projektrelevanten Daten gesammelt werden.

### Datenorganisation

**Grundlage**

+ **TUD-Leitlinie 5.** „Die TU Dresden verfügt über eine Grundausstattung an Forschungsdateninfrastruktur und stellt damit eine angemessene Aufbewahrung und die technische Verfügbarkeit von digitalen Forschungsdaten sicher“


**Umsetzung**

+ **Datenablage**  <!-- ergänzen durch Team Forschungsdaten -->
  + Zum Einsatz kommen ZIH-Dienste wie Gruppenlaufwerke, Cloudstore oder SharePoint.
  + Für bestimmte Anwendungsfälle kommt REDCap zum Einsatz.
+ **Gruppenlaufwerke/Ordnerstrukturen**
  + Für jedes Gruppenlaufwerk sollte eine Ansprechperson benannt werden und allen Mitarbeitenden bekannt sein; die Ansprechperson steht für Nachfragen zur Verfügung („Wo legt man diese und jene Datei ab?“), die Ansprechperson führt regelmäßig Qualitätskontrollen auf dem Gruppenlaufwerk durch 
  + Grundlegende Vorschläge für die Ordnerstruktur:
    + Berufliche Daten von privaten Daten trennen <!-- ??? --><!-- Kommentar Denise: das spielt m.E. hier keine Rolle, diese Richtlinien/Handreichung gilt für Forschungsdaten-->
    + Berufliche Daten aufteilen in Forschungsdaten und administrativen Daten <!-- ??? --> <!--Kommentar Denise: hier könnte eine genauere Erklärung helfen, dass administrative Daten nur wichtig sind, wenn diese zum besseren Verständnis der Forschungsdaten notwendig sind, so haben wir in der AO ja beschlossen, die Projektanträge/-bewilligungen mit abzulegen um den Projektablauf generell besser nachvollziehbar zu machen-->
    + Forschungsdaten aufteilen in Rohdaten, verarbeitete Daten, finale Daten  <!-- Analyseskripte, Stimuli und Experimentalskripte noch hinzufügen? oder ist dies genug durch den früheren Punkt Datendokumentation abgedeckt?-->
  + Weiterführende Links
    + Link zur Vorlage einer Referenzprojekt-Ordnerstruktur inkl. Readme.txt-Vorlage <!-- Folgende Professuren verwenden Ordnerstrukturen, die als Vorlage dienen könnten: „Behaviorale Psychotherapie“ und „Differentielle Psychologie“ -->
    + ggf. [BIDS](https://www.nature.com/articles/sdata201644)-Dateiablagesystem erwähnen

<!--Kommentar Christoph: Frage mich, ob man mal was anschaffen/ergänzen sollte zu Datenablage auf Hardware. Gerade für größere Daten (zB A5) sind Gruppenlaufwerke eher ungünstig. Vielleicht also mal größere Festplatten in einen PC einbauen und diesen dann als (offline) Datenablage nutzen? -->
>***Beispiel einer Checkliste für Datenpflege auf dem Gruppenlaufwerk***
>
>*Datentransfer*
>+ nur relevante Daten auf Gruppenlaufwerk ablegen <!-- Definition von „relevant“ ergänzen; im Zweifelsfall: Absprache im jeweiligen Team -->
>+ Datei an korrekter Stelle einfügen [im Zweifel nachfragen bei…]
>+ Eindeutig als zusammengehörig erkennbare Pakete aus Daten und Dokumentation schnüren
>
>*Datenqualität*
>+ Datenintegrität prüfen (Dateien nicht korrupt, d.h. lassen sich öffnen)
>+ Verifizierung der verwendeten Maßeinheiten/Abkürzungen gemäß Code Book 
>
>*Dokumentation*
>+ Ordner/Dateien gemäß Dateinamenskonvention benennen
>+ Codierungen aus Dateinamen und Spaltenköpfen im Code Book hinterlegen
>+ Code Book auf Aktualität und Vollständigkeit prüfen
>+ Readme.txt anlegen bzw. aufdatieren
>+ Skripte auskommentieren
>+ Beschreibung der Prozessabläufe in Manualen anlegen bzw. auf Aktualität prüfen
>
>*Datenhygiene*
>+ 10 min pro Woche einplanen für „Datenhygiene“ auf dem Gruppenlaufwerk (z.B. gemeinsam im Team-Meeting)
>+ Fokus-Treffen, um gemeinsam Strukturen/Standards für Readme, Gruppenlaufwerke und weitere FDM-Regeln auszuarbeiten

Jede Arbeitsgruppe sollte auf Basis dieses Beispiels eine Checkliste ausarbeiten, im Gruppenlaufwerk ablegen, regelmäßig aufdatieren <!-- Kommentar Denise: Was bedeutet das?-->und anwenden, sofern keine geeigneten alternativen Wege der Datenpflege beschritten werden (die dann allerdings gleichermaßen für alle Arbeitsgruppenmitglieder verbindlichen, dokumentierten und gut auffindbaren Regeln unterliegen müssen).

### Wissensmanagement Onboarding
+ Jede:r neue Mitarbeitende erhält diese FDM-Leitlinien zur Durchsicht (ggf. abzeichnen lassen?)<!--Beispiele für solche Dokumente finden sich bei den Professuren „Abhängiges Verhalten“ und „Arbeits- und Organisationspsychologie"--> <!--Kommentar Denise: zusätzliche Empfehlung einer unterschriebenen, verbindlichen Vereinbarung zwischen MA/Projektleitung mit der Lehrstuhlleitung? siehe AO-->
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
+ Dieser Prozess beginnt 3-6 Monate vor Austritt der:des Mitarbeitenden und kann unter Mitwirkung der [Kontaktstelle Forschungsdaten](https://tu-dresden.de/forschung-transfer/services-fuer-forschende/kontaktstelle-forschungsdaten) geplant und durchgeführt werden
+ Die Dokumente aus dem Offboarding sind u.a. Grundlage für das Onboarding der:des nachfolgenden Mitarbeitenden

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

[**Inhaltsverzeichnis**](RTFM_00_Inhalt.md) | [zurück zu **FDM-Kernprozesse**](RTFM_03_Kernprozesse.md) | [weiter zu **Ressourcen und Vorlagen**](RTFM_06_Ressourcen.md)
