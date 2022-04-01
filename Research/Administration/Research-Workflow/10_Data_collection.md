# Data Collection

## Table of Contents

- [Data Collection](#data-collection)
  - [Table of Contents](#table-of-contents)
  - [Before you start](#before-you-start)
  - [When you start](#when-you-start)
  - [During data collection](#during-data-collection)

---

> **Summary.** When assessing personal data (i.e., such that would make it possible to identify a given participant), we make sure to adhere to common guidelines for treating such data and also document the data collection priocess and the measures taken to protect such data. It is recommended to recruit and manage participants via ORSEE and to use REDCap for data acquisition and management. During data collection, we continuously perform data quality checks. ...

---

## Before you start

If you collect personal data (and be it only for some time to be able to schedule lab recordings of data that itself are anonymized), it is recommended to issue a so-called ["Verfahrensbeschreibung"](https://verfahrensbeschreibung.tu-dresden.de/vorlage_verfahrensbeschreibung.html). In fact, it is not only recommended, but mandatory ...  <!-- insert paragraph on "Verfahrensbeschreibung" -->

## When you start

It is strongly recommended that you use ORSEE for participant recruiting and management and REDCap for data collection. See here for further information:

- [ORSEE](https://github.com/alex-strobel/DPP-LabManual/wiki/ORSEE)
- [REDCap workflow](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Administration/REDCap/00_Content.md)

## During data collection

Continuously perform data quality checks:
These quality checks should definitely happen in the form of a **pilot study** before your main data collection starts.
By collecting data from 10, 15 participants (or as Alex would say: 8, 16, or 32 participants, and 64 for surveys) and [having written your analysis script](06_Analysis_plan.md) already, you can easily see whether there is something missing (some data is not being saved during the paradigm, a questionnaire got skipped, etc.), whether some of the data is outright bad (wrong thresholds during EEG measurement, data is being saved in a non-comprehensible way, etc.), or anything else that might be wrong.

Another tip is to **freshen up on your collection standards** from time to time.
What this means is to have a close look at your session guidelines, your EEG preparation notes, and the way you are supposed to instruct the participants verbally every 20-30 participants.
*Especially* if you are not the only one, but have research assistants helping you with data collection.
Schedule freshen-up-meetings from time to time to avoid systematic drifts and decline in data quality.

If using Bayesian sequential testing, continuously monitor evolution of Bayes factors!
Yet, if you do not use it or another preregistered sequential testing procedure, don't sneak at the data for other purposes than quality control!

...

---

[**Table of Contents**](#README.md) | [back to **Preregistration**](09_Preregistration.md) | [next to **Preprocessing**](11_Preprocessing.md)
