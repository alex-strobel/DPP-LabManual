# Reference management

## Table of Contents

- [Reference management](#reference-management)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Reference Managers](#reference-managers)
    - [Endnote](#endnote)
    - [Mendeley](#mendeley)
    - [Zotero](#zotero)
    - [BibTeX](#bibtex)
    - [JabRef](#jabref)

## Introduction

**It is absolutely essential that you use a reference manager!** It not only allows you to store and organize your references, e.g., by bundling them together according to topics, methods, or authors. It also makes it easier to cite them in a manuscript. Because different journals/journal publishers use different citation styles (be it APA, Harvard, or Vancouver style to name but three of the almost endless list of citation styles), it would take you hours if in a given manuscript you wanted to insert your citations in the correct citation style by hand. Even more important: If your manuscript was rejected at Journal A that uses APA style and you wanted to submit it to Journal B that uses a numbered citation sytle such as Vancouver, you literally would need to rewrite your whole manuscript. Using a reference manager enables you to simply select and insert the references you want to cite, have them added to the reference list in the appropriate format and have the whole manuscript re-formatted in case you want to change the citation style.

## Reference Managers

### Endnote

...

### Mendeley

...

### Zotero

Zotero is a free, open-source reference manager and can be downloaded from the [Zotero Website](https://www.zotero.org/).
You can easily import entries with the browser add-on, and it is a good reference manager for beginners as it works especially well with Microsoft Word via an add-on.
Zotero allows you to easily access the citation style settings, as well as the appearance of single citations within the text.
However, every time you re-open the document, it will ask you whether every single changes is _really_ the way you want it, which is slightly annoying.
There are also quite a lot of processes going on behind the scenes, so Zotero is slow, and it is not possible to access the citation key of an entry (so Zotero is not suitable for R Markdown) or to permanently change the capitalization of the reference list, because re-opening the document will reset the reference list, but not the in-text citations (which you are asked about in detail).
But don't worry, you can easily export you Zotero library into JabRef!

### BibTeX

...

### JabRef

JabRef is a free, open-source reference manager and can be downloaded from the [JabRef Website](https://www.jabref.org/).
It has a modern and intuitive interface, so it is nicer to work with than Zotero. While Zotero works well for writing manuscripts in Microsoft Word, JabRef is a better option for writing in R Markdown, because the export into a *.bib file is smoother and you can easily access and change the citation key of every entry.
You can easily import entries by (among other options) using the browser add-on, the DOI, or copy-pasting the BibTeX formatted citation, which is especially useful for R packages and other software.
Another advantage: JabRefs allows you to change the formatting of multiple entries at once.
For example, you want to change the title field of every entry of the type "article" to have only the first word written with a capital letter.
While you cannot do this in Zotero, you can do it in JabRef.
Using JabRef for manuscripts written in Microsoft Word is also possible, but not as easy as it is with Zotero, because there is no add-on.