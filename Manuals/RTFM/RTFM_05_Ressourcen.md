# Richtlinien für Transparenz im Forschungsdaten-Management

> „Die langfristige Sicherung und Bereitstellung der Forschungsdaten leistet einen Beitrag zur Nachvollziehbarkeit und Qualität der wissenschaftlichen Arbeit und eröffnet wichtige Anschlussmöglichkeiten für die weitere Forschung.“<br> 
aus den [DFG-Leitlinien zum Umgang mit Forschungsdaten](https://www.dfg.de/download/pdf/foerderung/grundlagen_dfg_foerderung/forschungsdaten/leitlinien_forschungsdaten.pdf)

---

## Ressourcen und Vorlagen

### Ressourcen

<!-- Format und genaue Bezeichnung sind noch offen. Aktuell steht folgende Lösung im Raum: kuratierte Linkliste auf einer Seite des webCMS der Fakultät Psychologie aufschalten. Alternative: Intranet? (falls Zugriffsbeschränkung sinnvoll). Die Verwendung von z.B. Wiki-Tools ginge einher mit einem erhöhten Administrationsaufwand. Die hier aufgeführten Vorschläge für die Inhalte stammen aus unseren Gesprächen mit den Professuren -->
+ Landing Page mit Neuigkeiten zur Fakultät 
+ Gesammelte Links zu Dokument-Vorlagen aus dieser FDM-Leitlinie
  + Checkliste Onboarding
  + Checkliste Offboarding
  + Checkliste für Datenpflege auf dem Gruppenlaufwerk
  + ggf. Link zu REDCap-Templates
  + ggf. Link zu OSF-Template
+ IT-Dienste des ZIH
  + Buchung von IT-Services des ZIH über das [Self Service Portal](https://selfservice.zih.tu-dresden.de/l/index.php/spor/request-form/)
  + Zentrale Datenspeicher der TU Dresden: [Gruppenlaufwerke](https://tu-dresden.de/zih/dienste/service-katalog/arbeitsumgebung/datenspeicher/details)
  + Verschlüsselung von Laufwerken mit [Boxcryptor](https://tu-dresden.de/tu-dresden/organisation/zentrale-universitaetsverwaltung/dezernat-3-zentrale-angelegenheiten/sg-3-5-informationssicherheit/tud-cert/dateiverschluesselung-boxcryptor) 
  + [Cloudstore](https://tu-dresden.de/zih/dienste/service-katalog/zusammenarbeiten-und-forschen/datenaustausch/cloudstore) der TU Dresden
  + Versendung verschlüsselter Mails mit [Secure Mail](https://tu-dresden.de/tu-dresden/organisation/zentrale-universitaetsverwaltung/dezernat-3-zentrale-angelegenheiten/sg-3-5-informationssicherheit/securemail)
+ Datenschutz
  + Übersicht [Creative Commons Lizenzen](https://www.bertelsmann-stiftung.de/fileadmin/files/BSt/Publikationen/Infomaterialien/IN_Freie_Lizenzen_-_einfach_erklaert_Poster_2017_07_20.pdf) bzw. [Creative Commons Licence Chooser](https://chooser-beta.creativecommons.org)
  + [Professur für Urheberrecht und geistiges Eigentum](https://tu-dresden.de/gsw/phil/irget/jfbimd13/die-professur) der TU Dresden
  + [Datenschutzbeauftragte:r](https://tu-dresden.de/tu-dresden/organisation/gremien-und-beauftragte/beauftragte/datenschutzbeauftragter) der TU Dresden 
+ Links mit administrativen Informationen, z.B. Anleitungen zu Verwaltungsabläufen der Fakultät oder Leitfaden für die Anfertigung von [Bachelorarbeiten](https://tu-dresden.de/mn/psychologie/ressourcen/dateien/studium/dokumentencenter/Leitfaden-Anfertigung-Bachelorarbeiten.pdf?lang=de) bzw. [Masterarbeiten](https://tu-dresden.de/mn/psychologie/ressourcen/dateien/studium/dokumentencenter/Leitfaden-Anfertigung-Masterarbeiten.pdf?lang=de)
  + ggf. Liste mit Weiterbildungsangeboten (Zentrum für Weiterbildung, SLUB, Graduiertenakademie) und nützlichen Links (z.B. zu Video-Tutorials)
  + ggf. Glossar mit Begriffen aus dem Kontext FDM und Fakultät Psychologie

### Vorlagen

#### Readme.txt

```
# Title      : README for folder "Raw Data" 
# Date       : 2022-01-04
# Author     : Max Mustermann
# Description: Contains raw data in ASCII format from study X conducted in 2021 
```

#### Code Book

| Variable name | Description | Range/Units/Values |
| ------------- | ----------- | ------------------ |
| id | identifier | 1-138 |
| age | age | 18-38 |
| gen | gender | 1 = male, 2 = female, 3 = diverse |
| edu | education | 0 = no university entrance diploma (UED), 1 = UED |
| job | job | 0 = training/studies, 1 = unemployed, 2 = employed |
| bfi2_01 | Big Five Inventory 2, Item 1 | -2 = stimme überhaupt nicht zu (fully disagree) ... +2 = stimme voll und ganz zu (fully agree) |
| ... | | | 

---

[**Inhaltsverzeichnis**](RTFM_00_Inhalt.md) | [zurück zu **Unterstützende Prozesse**](RTFM_04_Support.md)
