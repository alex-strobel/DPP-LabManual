# Reference management

## Table of Contents

- [Reference management](#reference-management)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Reference Managers](#reference-managers)
    - [Mendeley](#mendeley)
    - [Endnote](#endnote)
    - [Zotero](#zotero)
    - [BibTeX](#bibtex)
    - [JabRef](#jabref)

## Introduction

**It is absolutely essential that you use a reference manager!** It not only allows you to store and organize your references, e.g., by bundling them together according to topics, methods, or authors. It also makes it easier to cite them in a manuscript. Because different journals/journal publishers use different citation styles (be it APA, Harvard, or Vancouver style to name but three of the almost endless list of citation styles), it would take you hours if in a given manuscript you wanted to insert your citations in the correct citation style by hand. Even more important: If your manuscript was rejected at Journal A that uses APA style and you wanted to submit it to Journal B that uses a numbered citation style such as Vancouver, you literally would need to rewrite your whole manuscript. Using a reference manager enables you to simply select and insert the references you want to cite, have them added to the reference list in the appropriate format and have the whole manuscript re-formatted in case you want to change the citation style.

## Reference Managers

### Mendeley

We @AG.DPP avoid using [Mendeley](https://www.mendeley.com), although it comes with no extra costs. It is run by [Elsevier](https://de.wikipedia.org/wiki/Elsevier#Kritik_an_Elsevier) and is likely to aid Elsevier's efforts to track scholars' activities and sell their research profiles.

### Endnote

We @AG.DPP avoid using [Endnote](https://endnote.com), not only because it comes with some extra costs. 
It is run by [Clarivate](https://en.wikipedia.org/wiki/Clarivate), and it is not unlikely that they also track scholars' activities and sell research profiles.
Still, Endnote has its benefits:

- Many scholars use it, so one can easily share libraries.
- It saves not only references, but also attached the respective PDF files, so you can not only organize your references, but also have all information about them in one place.
- It can be integrated in *Word* quite nicely via the *Cite While You Write* interface.
- If working collaboratively (such as in a CRC), it may become necessary to use Endnote.

### Zotero

Zotero is a free, open-source reference manager and can be downloaded from the [Zotero Website](https://www.zotero.org/).
You can easily import entries with the browser add-on, and it is a good reference manager for beginners as it works especially well with Microsoft Word via an add-on.
Zotero allows you to easily access the citation style settings, as well as the appearance of single citations within the text.
However, every time you re-open the document, it will ask you whether every single changes is _really_ the way you want it, which is slightly annoying.
There are also quite a lot of processes going on behind the scenes, so Zotero is slow, and it is not possible to access the citation key of an entry (so Zotero is not suitable for R Markdown) or to permanently change the capitalization of the reference list, because re-opening the document will reset the reference list, but not the in-text citations (which you are asked about in detail).
But don't worry, you can easily export you Zotero library into JabRef!

### BibTeX

BibTeX already reads like it has something to do with LaTeX, and indeed, it is the citation solution for LaTeX documents and, hence, also for R Markdown documents. 
A BibTeX library is a simple text document that contains entries in the following format:

```
@Article{Gignac2016,
author = {G. E. Gignac  and E. T. Szodorai},
title = {Effect size guidelines for individual differences researchers},
journal = {Personality and Individual Differences},
year = {2016},
volume = {102},
pages = {74-78},
doi = {10.1016/j.paid.2016.06.069},
}
```

A BibTeX library can be easily written by hand, having the respective references saved on your computer.
Yet, most publishers offer the opportunity to save references to articles in BibTeX format, so there are only minimal edits needed when you paste the downloaded references into your BibTeX library.
Also, you can fetch BibTeX formatted references using JabRef (see below) or import them from Endnote via the BibTeX Export output style that can be downloaded from the Endnote web site: <https://endnote.com/style_download/bibtex-export/>.
Double-click it, which should load it into Endnote, and then (under Edit) set it as Output Citation Style.
Then export your Endnote file via `File > Export` to the desired location (please note that if you want to keep the old name and save the BibTex file to the same folder as the original file this might not work. 
Therefore, choose another filename or folder).

In your R Markdown document, you provide the name of the BibTeX library in the so-called YAML header via the `bibliography:` argument. 
The format of the citation is defined by a Citation Style Language file that needs to be provided in the YAML header as well via the `csl:` argument. 
As an example:

```
---
title: "My Manuscript"
author: "Alexander Strobel"
output: pdf_document
bibliography: MyLibrary.bib
csl: apa7.csl
---
```

Of course, you need to save the BibTeX library and the citation style in the same folder as your manuscript. 
Once you have set up your BibTeX library, citing is quite straightforward: 
To cite some reference, just write something like "For the present work, we used recently established effect size guidelines for correlations [@Gignac2016]." to have the reference cited in parentheses or "For the present work, we used the effect size guidelines for correlations recently established by @Gignac2016." for citing the reference directly in the text.   

### JabRef

JabRef is a free, open-source reference manager and can be downloaded from the [JabRef Website](https://www.jabref.org/).
It has a modern and intuitive interface, so it is nicer to work with than Zotero. While Zotero works well for writing manuscripts in Microsoft Word, JabRef is a better option for writing in R Markdown, because the export into a *.bib file is smoother and you can easily access and change the citation key of every entry.
You can easily import entries by (among other options) using the browser add-on, the DOI, or copy-pasting the BibTeX formatted citation, which is especially useful for R packages and other software.
Another advantage: JabRefs allows you to change the formatting of multiple entries at once.
For example, you want to change the title field of every entry of the type "article" to have only the first word written with a capital letter.
While you cannot do this in Zotero, you can do it in JabRef.
Using JabRef for manuscripts written in Microsoft Word is also possible, but not as easy as it is with Zotero, because there is no add-on.
